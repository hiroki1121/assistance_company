class Review < ApplicationRecord
  belongs_to :consignment_side_user
  belongs_to :post

  with_options presence: true do
    validates :title
    validates :score
    validates :comment, length: { maximum: 500 }
  end
end
