class ReviewsController < ApplicationController
  before_action :set_post_id, only: [:index, :new, :create]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @review = Review.where(post_id: @post.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to favorite_path(@post)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to favorite_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    redirect_to favorite_path(@post) if @review.destroy
  end

  private

  def set_post_id
    @post = Post.find(params[:post_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :score).merge(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
  end
end
