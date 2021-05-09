class ConsignmentSideUsersController < ApplicationController
  def show
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id)
    @posts = Post.where(params[id: @favorite.post_id]) if @favorite.present?
  end
end
