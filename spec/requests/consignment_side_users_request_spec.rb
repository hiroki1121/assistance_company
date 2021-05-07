require 'rails_helper'

RSpec.describe "ConsignmentSideUsers", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/consignment_side_users/show"
      expect(response).to have_http_status(:success)
    end
  end

end
