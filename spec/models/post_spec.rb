require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '会社投稿' do
    context '投稿できるとき' do
      it '必要な情報を適切に入力すると、投稿ができる' do
        expect(@post).to be_valid
      end
      it '建物名が未入力でも、投稿ができる' do
        @post.building_name = ''
        expect(@post).to be_valid
      end
      it '部署が未入力でも、投稿ができる' do
        @post.division = ''
        expect(@post).to be_valid
      end
      it '電話番号（直通）が未入力でも、投稿ができる' do
        @post.direct_phone_number = ''
        expect(@post).to be_valid
      end
    end
    context '投稿ができない時' do
      it '会社情報として、イメージ写真が必須であること' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('イメージ写真を入力してください')
      end
      it '会社情報として、会社名が必須であること' do
        @post.company_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('会社名を入力してください')
      end
      it '会社情報として、郵便番号が必須であること' do
        @post.post_code = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '会社情報として、郵便番号が正しい記述になっていること' do
        @post.post_code = '1234567'
        @post.valid?
        expect(@post.errors.full_messages).to include('郵便番号を正しく入力してください')
      end
      it '会社情報として、都道府県が1では投稿できないこと(初期値が1)' do
        @post.prefecture_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県は---以外を選択してください')
      end
      it '会社情報として、住所が必須であること' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('住所を入力してください')
      end
      it '会社情報として、代表者名が必須であること' do
        @post.representative_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('代表者名を入力してください')
      end
      it '会社情報として、メールアドレスが必須であること' do
        @post.email = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '会社情報として、メールアドレスは、@を含む必要があること' do
        @post.email = 'abcdefg'
        @post.valid?
        expect(@post.errors.full_messages).to include('メールアドレスを正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は必須であること' do
        @post.represent_phone_number = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を入力してください')
      end
      it '会社情報として、電話番号（代表）は10桁又は11桁であること(9桁の場合)' do
        @post.represent_phone_number = 123_456_789
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は10桁又は11桁であること(12桁の場合)' do
        @post.represent_phone_number = 123_456_789_123
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は(-)ハイフンを入力しないこと' do
        @post.represent_phone_number = 123 - 456 - 7891
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は数字のみ保存が可能なこと(平仮名の場合)' do
        @post.represent_phone_number = 'あいうえおかきくけこ'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は数字のみ保存が可能なこと(カタ仮名の場合)' do
        @post.represent_phone_number = 'アイウエオカキクケコ'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（代表）は数字のみ保存が可能であること(全角数字の場合)' do
        @post.represent_phone_number = '１２３４５６７８９１'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（代表）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は10桁又は11桁であること(9桁の場合)' do
        @post.direct_phone_number = 123_456_789
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は10桁又は11桁であること(12桁の場合)' do
        @post.direct_phone_number = 123_456_789_123
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は(-)ハイフンを入力しないこと' do
        @post.direct_phone_number = 123 - 456 - 7891
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は数字のみ保存が可能なこと(平仮名の場合)' do
        @post.direct_phone_number = 'あいうえおかきくけこ'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は数字のみ保存が可能なこと(カタ仮名の場合)' do
        @post.direct_phone_number = 'アイウエオカキクケコ'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、電話番号（直通）は数字のみ保存が可能であること(全角数字の場合)' do
        @post.direct_phone_number = '１２３４５６７８９１'
        @post.valid?
        expect(@post.errors.full_messages).to include('電話番号（直通）を正しく入力してください')
      end
      it '会社情報として、会社概要が必須であること' do
        @post.business_detail = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('会社概要を入力してください')
      end
      it '会社情報として、会社概要は500文字以内にであること(501文字の場合)' do
        @post.business_detail = Faker::Lorem.characters(number: 501)
        @post.valid?
        expect(@post.errors.full_messages).to include('会社概要は500文字以内で入力してください')
      end
    end
  end
end
