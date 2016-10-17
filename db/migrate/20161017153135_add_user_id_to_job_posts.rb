class AddUserIdToJobPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :user_id, :integer
    add_index :job_posts, :user_id
  end
end
