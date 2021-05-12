class Review < ApplicationRecord
  belongs_to :consignment_side_user
  belongs_to :post

  with_options presence: true do
    validates :title
    validates :comment
    validates :score
  end
end
