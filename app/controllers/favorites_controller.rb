class FavoritesController < ApplicationController
  before_action :authenticate_consignment_side_user!, only: [:create, :destroy]
  before_action :set_post, only: [:create, :destroy]

  def create
    @favorite = Favorite.create(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
    redirect_to post_path(@post)
  end

  def destroy
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
    @favorite.delete
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
