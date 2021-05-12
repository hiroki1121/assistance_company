class ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
