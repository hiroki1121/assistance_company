class ContractedSideUsersController < ApplicationController
  before_action :authenticate_any!
  def show
    @post = Post.where(params[contracted_side_user_id: current_contracted_side_user.id])
  end

  private

  def authenticate_any!
    redirect_to contracted_side_user_session_path unless contracted_side_user_signed_in?
  end
end
