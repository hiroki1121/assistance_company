class PostsController < ApplicationController
  before_action :authenticate_any!, except: [:index]

  def index
    @posts = Post.order('created_at DESC')
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

  def favirites
    @favirite = current_consignment_side_user.favirites_posts.includes(:consignment_side_user).order(created_at: :desc)
  end
end

private

def post_params
  params.require(:post).permit(
    :image, :company_name, :post_code, :prefecture_id, :address,
    :building_name, :employee_number, :division, :representative_name,
    :email, :represent_phone_number, :direct_phone_number, :business_detail
  ).merge(contracted_side_user_id: current_contracted_side_user.id)
end

def authenticate_any!
  redirect_to contracted_side_user_session_path unless contracted_side_user_signed_in?
  redirect_to consignment_side_user_session_path unless consignment_side_user_signed_in?
end
