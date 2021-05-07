class Favorite < ApplicationRecord
  belongs_to :consignment_side_user
  belongs_to :post

  validates :consignment_side_user_id, uniqueness: { scope: :post_id}
end
