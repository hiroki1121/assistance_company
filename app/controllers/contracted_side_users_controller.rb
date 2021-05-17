class ContractedSideUsersController < ApplicationController
  before_action :authenticate_any!
  def show
    @posts = Post.where(contracted_side_user_id: current_contracted_side_user.id).order("created_at DESC")
    @post = Post.find_by(contracted_side_user_id: current_contracted_side_user.id)
  end

  private

  def authenticate_any!
    redirect_to new_contracted_side_user_session_path unless contracted_side_user_signed_in?
  end
end
