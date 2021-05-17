class ConsignmentSideUsersController < ApplicationController
  before_action :authenticate_consignment_side_user!

  def show
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id)
    favorites = Favorite.where(
      consignment_side_user_id: current_consignment_side_user.id
    ).order(created_at: :desc).pluck(:post_id)
    @posts = Post.find(favorites)
  end
end
