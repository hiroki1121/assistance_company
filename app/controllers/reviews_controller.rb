class ReviewsController < ApplicationController
  before_action :set_post, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @review = Review.where(post_id: @post.id).order('created_at DESC')
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to post_reviews_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    redirect_to post_reviews_path(@post) if @review.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :score).merge(
      consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id
    )
  end
end
