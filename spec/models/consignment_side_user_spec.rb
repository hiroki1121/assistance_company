require 'rails_helper'

RSpec.describe ConsignmentSideUser, type: :model do
  before do
    @consignment_side_user = FactoryBot.build(:consignment_side_user)
  end
  describe '新規登録／ユーザー情報' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、新規登録ができる' do
        expect(@consignment_side_user).to be_valid
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @consignment_side_user.password = 'a12345'
        @consignment_side_user.password_confirmation = 'a12345'
        expect(@consignment_side_user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'メールアドレスが必須であること' do
        @consignment_side_user.email = ''
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'メールアドレスが一意性であること' do
        @consignment_side_user.save
        another_user = FactoryBot.build(:consignment_side_user)
        another_user.email = @consignment_side_user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @consignment_side_user.email = 'sample'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('メールアドレスは不正な値です', 'メールアドレスを正しく入力してください')
      end
      it 'パスワードが必須であること' do
        @consignment_side_user.password = ''
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードは、6文字以上での入力が必須であること(５文字で入力)' do
        @consignment_side_user.password = 'a1234'
        @consignment_side_user.password_confirmation = 'a1234'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @consignment_side_user.password = 'a12345'
        @consignment_side_user.password_confirmation = ''
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('Password confirmationとパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @consignment_side_user.password = 'a12345'
        @consignment_side_user.password_confirmation = 'b12345'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('Password confirmationとパスワードの入力が一致しません')
      end
      it 'パスワードは英字のみでは登録できない' do
        @consignment_side_user.password = 'abcdef'
        @consignment_side_user.password_confirmation = 'abcdef'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
      it 'パスワードは数字のみでは登録できない' do
        @consignment_side_user.password = '123456'
        @consignment_side_user.password_confirmation = '123456'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
      it 'パスワードは全角では登録できない' do
        @consignment_side_user.password = '１２３４５６'
        @consignment_side_user.password_confirmation = '１２３４５６'
        @consignment_side_user.valid?
        expect(@consignment_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
    end
  end
  describe '新規登録/本人情報確認' do
    it '本名は、名字が必須であること' do
      @consignment_side_user.last_name = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前（姓）を入力してください')
    end
    it '本名は、名前が必須であること' do
      @consignment_side_user.first_name = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前（名）を入力してください')
    end
    it '本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること(半角の場合)' do
      @consignment_side_user.last_name = 'yamada'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前（姓）を正しく入力してください')
    end
    it '本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること(半角の場合)' do
      @consignment_side_user.first_name = 'taro'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前（名）を正しく入力してください')
    end
    it '本名のフリガナは、名字とが必須であること' do
      @consignment_side_user.last_name_ruby = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（姓）を入力してください')
    end
    it '本名のフリガナは、名前が必須であること' do
      @consignment_side_user.first_name_ruby = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（名）を入力してください')
    end
    it '本名のフリガナは、名字が全角（カタカナ）での入力が必須であること(全角平仮名の場合)' do
      @consignment_side_user.last_name_ruby = 'やまだ'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（姓）を正しく入力してください')
    end
    it '本名のフリガナは、名前が全角（カタカナ）での入力が必須であること(全角平仮名の場合)' do
      @consignment_side_user.first_name_ruby = 'たろう'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（名）を正しく入力してください')
    end
    it '本名のフリガナは、名字が全角（カタカナ）での入力が必須であること(半角の場合)' do
      @consignment_side_user.last_name_ruby = 'yamada'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（姓）を正しく入力してください')
    end
    it '本名のフリガナは、名前が全角（カタカナ）での入力が必須であること(半角の場合)' do
      @consignment_side_user.first_name_ruby = 'taro'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('お名前カナ（名）を正しく入力してください')
    end
    it '会社名は、必須であること' do
      @consignment_side_user.company_name = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('会社名を入力してください')
    end
    it '電話番号は、必須であること' do
      @consignment_side_user.phone_number = ''
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を入力してください')
    end
    it '電話番号は、10桁又は11桁であること(9桁の場合)' do
      @consignment_side_user.phone_number = 123456789
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it '電話番号は、10桁又は11桁であること(12桁の場合)' do
      @consignment_side_user.phone_number = 123456789123
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it '電話番号は、(-)ハイフンを入力しないこと' do
      @consignment_side_user.phone_number = 012-345-6789
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it '電話番号は、数字のみ保存可能なこと(平仮名の場合)' do
      @consignment_side_user.phone_number = 'あいうえおかきくけこ'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it '電話番号は、数字のみ保存可能なこと(カタ仮名の場合)' do
      @consignment_side_user.phone_number = 'アイウエオカキクケコ'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
    it '電話番号は、数字のみ保存可能なこと(全角数字の場合)' do
      @consignment_side_user.phone_number = '０１２３４５６７８９'
      @consignment_side_user.valid?
      expect(@consignment_side_user.errors.full_messages).to include('電話番号を正しく入力してください')
    end
  end
end
