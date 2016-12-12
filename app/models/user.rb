class User < ApplicationRecord

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_and_belongs_to_many :specialities

  belongs_to :job_post

  has_many :job_post_comments, foreign_key: "user_id", dependent: :destroy
  has_many :job_posts, through: :job_post_comments

  has_many :job_post_views, foreign_key: "user_id", dependent: :destroy
  has_many :job_posts, through: :job_post_views

  has_many :job_post_users, foreign_key: "user_id", dependent: :destroy
  has_many :job_posts, through: :job_post_users

  has_many :portfolios, dependent: :destroy

  has_many :portfolio_comments, foreign_key: "user_id", dependent: :destroy
  has_many :commentable_portfolios, through: :portfolio_comments, :class_name => "Portfolio"

  has_many :portfolio_view_likes, foreign_key: "user_id", dependent: :destroy
  has_many :viewable_portfolios, through: :portfolio_view_likes, :class_name => "Portfolio"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: { minimum: 6, maximum: 20 },
  format: { with: /\A[a-z\w]{6,20}/ }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Return the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Return a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forget a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Send activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Defines a proto-feed
  # See "Following users" for the full implementations.
  def feed
    following_ids = "SELECT followed_id FROM relationships
      WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id",
      user_id: id)
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Apllying for a job in job board
  def apply(job_post)
    job_post_users.create(job_post_id: job_post.id)
  end

  # Return true if the current user is applying the job
  def applying?(job_post)
    job_post_users.exists?(job_post_id: job_post)
  end

  #Cancel the applied job in job board
  def cancel_job(job_post)
    job_post_users.find_by(job_post_id: job_post.id).destroy
  end

  # Returns full name
  def name
    self.first_name + " " + self.last_name
  end

  private
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end


end
