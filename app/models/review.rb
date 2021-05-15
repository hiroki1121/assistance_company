class Review < ApplicationRecord
  belongs_to :consignment_side_user
  belongs_to :post

  with_options presence: true do
    validates :title
    validates :comment
    validates :score, numericality: { other_than: 1, message: 'を選択してください' }
  end
end
