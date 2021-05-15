class FavoritesController < ApplicationController
  before_action :authenticate_any!, only: [:create, :destroy]
  before_action :set_post, only: [:create, :destroy, :show]

  def create
    @favorite = Favorite.create(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
    redirect_to post_favorite_path(@post, @favorite)
  end

  def destroy
    @favorite = Favorite.find_by(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
    @favorite.delete
    redirect_to post_favorite_path(@post)
  end

  def show
    Favorite.find_by(post_id: @post.id)
    @review = Review.where(post_id: @post.id)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def authenticate_any!
    redirect_to consignment_side_user_session_path unless consignment_side_user_signed_in?
  end
end
