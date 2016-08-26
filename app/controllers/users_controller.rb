class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def user_recommendations
    @recommendations = current_user.recommendations
  end

  def user_params
    params.require(:user).permit(:user_id, :name, :bairro, :facebook_picture_url, :first_name, :last_name)
  end
end
