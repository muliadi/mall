module UsersHelper

  def user_location
    @user.city + ", " + @user.country
  end
end
