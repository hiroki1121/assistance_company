class FavoritesController < ApplicationController
  before_action :authenticate_any!, only: [:create, :destroy]
  before_action :set_post

  def create
    consignment_side_user = current_consignment_side_user
    Favorite.create(consignment_side_user_id: consignment_side_user.id, post_id: @post.id)
    redirect_to post_favorites_path(@post)
  end
  
  def destroy
    consignment_side_user = current_consignment_side_user
    @favorite = Favorite.find_by(consignment_side_user_id: consignment_side_user.id, post_id: @post.id)
    @favorite.delete
    redirect_to post_favorites_path(@post)
  end
  
  def show
    Favorite.all
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def authenticate_any!
    redirect_to consignment_side_user_session_path unless consignment_side_user_signed_in?
  end
end
