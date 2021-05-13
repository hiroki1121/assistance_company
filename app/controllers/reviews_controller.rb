class ReviewsController < ApplicationController
  before_action :set_post, only: [:new, :create]

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :score).merge(consignment_side_user_id: current_consignment_side_user.id, post_id: @post.id)
  end
end
