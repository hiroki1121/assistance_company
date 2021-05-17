class ContractedSideUsersController < ApplicationController
  before_action :authenticate_contracted_side_user!

  def show
    @posts = Post.where(contracted_side_user_id: current_contracted_side_user.id).order("created_at DESC")
    @post = Post.find_by(contracted_side_user_id: current_contracted_side_user.id)
  end
end
