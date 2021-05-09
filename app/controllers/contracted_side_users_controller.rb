class ContractedSideUsersController < ApplicationController
  def show
    @post = Post.where(params[contracted_side_user_id: current_contracted_side_user.id])
  end
end
