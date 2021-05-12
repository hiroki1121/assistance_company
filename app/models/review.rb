class Review < ApplicationRecord
  belongs_to :consignment_side_user
  belongs_to :post
end
