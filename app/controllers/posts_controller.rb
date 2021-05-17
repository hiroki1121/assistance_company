class PostsController < ApplicationController
  before_action :authenticate_contracted_side_user!, except: [:index, :search]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :search_post, only: [:index, :search]

  def index
    @posts = Post.order('created_at DESC').limit(20)
    @favorite = Favorite.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_favorite_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @post.destroy
  end

  def search
    @posts = @q.result.includes(:contracted_side_user).order('created_at DESC')
    @favorite = Favorite.find_by(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(
      :image, :industry_id, :company_name, :company_url, :post_code, :prefecture_id, :address,
      :building_name, :employee_number, :division, :representative_name,
      :email, :represent_phone_number, :direct_phone_number, :business_detail
    ).merge(contracted_side_user_id: current_contracted_side_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_post
    @q = Post.ransack(params[:q])
  end
end
