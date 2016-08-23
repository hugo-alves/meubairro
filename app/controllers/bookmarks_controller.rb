class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    # @user = current_user
    current_user.bookmarks.create(recommendation_id: params[:recommendation_id])
    redirect_to user_bookmarks_path(current_user)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit([:recommendation])
  end
end
