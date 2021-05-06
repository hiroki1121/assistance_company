class ConsignmentSideUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :favirites

  VALID_EAMIL_REGEX = /\A[A-Za-z0-9.+_-]+@([A-Za-z0-9_-]+\.)+[A-Za-z]{2,}\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_NAME_RUBY_REGEX = /\A[ァ-ヶ]+\z/.freeze
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze

  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: true }, format: { with: VALID_EAMIL_REGEX, message: 'を正しく入力してください' }
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'を正しく入力してください' }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'を正しく入力してください' }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'を正しく入力してください' }
    validates :last_name_ruby, format: { with: VALID_NAME_RUBY_REGEX, message: 'を正しく入力してください' }
    validates :first_name_ruby, format: { with: VALID_NAME_RUBY_REGEX, message: 'を正しく入力してください' }
    validates :company_name
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: 'を正しく入力してください' }
  end
end
