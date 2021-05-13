class ReviewsController < ApplicationController
  before_action :set_post_id, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update]

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

  def show
    @reviews = Review.where(post_id: @post.id)
    @review = Review.find(params[:id])
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
