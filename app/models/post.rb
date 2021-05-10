class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :contracted_side_user
  has_many :favorites, dependent: :destroy
  has_many :consignment_side_user, through: :favirites

  VALID_POST_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  VALID_EAMIL_REGEX = /\A[A-Za-z0-9.+_-]+@([A-Za-z0-9_-]+\.)+[A-Za-z]{2,}\z/.freeze
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze
  VALID_COMPANY_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/.freeze

  with_options presence: true do
    validates :image
    validates :industry_id, numericality: { other_than: 1, message: 'は---以外を選択してください' }
    validates :company_name
    validates :post_code, format: { with: VALID_POST_CODE_REGEX, message: 'を正しく入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は---以外を選択してください' }
    validates :address
    validates :employee_number
    validates :representative_name
    validates :email, format: { with: VALID_EAMIL_REGEX, message: 'を正しく入力してください' }
    validates :represent_phone_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: 'を正しく入力してください' }
    validates :business_detail, length: { maximum: 500 }
  end
  validates :company_url, format: { with: VALID_COMPANY_URL_REGEX, message: 'を正しく入力してください' }, allow_blank: true
  validates :direct_phone_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: 'を正しく入力してください' }, allow_blank: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :industry
  belongs_to :prefecture
end

