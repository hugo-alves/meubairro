class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def user_recommendations
    @recommendations = current_user.recommendations
  end

  def user_params
    params.require(:user).permit(:name, :bairro, :facebook_picture_url, :facebook_picture_url_cache, :first_name, :last_name)
  end
end
