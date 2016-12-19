module UsersHelper

  # Returns the Gravatar for the given user.
  def profile_picture_for(user, options = { size: 80 })
    profile_picture = user.profile_pictures.where(activated: true)
    size = options[:size]
    if profile_picture.any?
      image_tag(profile_picture.take.picture, alt: user.name, class: "profile_picture")
    end
  end

end
