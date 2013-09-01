module UserHelper
  def gravatar_for(user)
    Gravatar.new(User.find(user.id).email).image_url
  end
end
