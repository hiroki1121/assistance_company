class ConsignmentSideUsersController < ApplicationController
  before_action authenticate_any!

  def show
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id)
    @posts = Post.where(params[id: @favorite.post_id]) if @favorite.present?
  end

  private

  def authenticate_any!
    redirect_to consignment_side_user_session_path unless consignment_side_user_signed_in?
  end
end
