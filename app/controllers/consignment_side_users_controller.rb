class ConsignmentSideUsersController < ApplicationController
  before_action :authenticate_any!

  def show
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id)
    favorites = Favorite.where(
      consignment_side_user_id: current_consignment_side_user.id
    ).order(created_at: :desc).pluck(:post_id)
    @posts = Post.find(favorites)
  end

  private

  def authenticate_any!
    redirect_to new_consignment_side_user_session_path unless consignment_side_user_signed_in?
  end
end
