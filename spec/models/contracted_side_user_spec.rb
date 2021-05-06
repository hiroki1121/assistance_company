require 'rails_helper'

RSpec.describe ContractedSideUser, type: :model do
  before do
    @contracted_side_user = FactoryBot.build(:contracted_side_user)
  end
  describe '新規登録／ユーザー情報' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると、新規登録ができる' do
        expect(@contracted_side_user).to be_valid
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @contracted_side_user.password = 'a12345'
        @contracted_side_user.password_confirmation = 'a12345'
        expect(@contracted_side_user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'メールアドレスが必須であること' do
        @contracted_side_user.email = ''
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'メールアドレスが一意性であること' do
        @contracted_side_user.save
        another_user = FactoryBot.build(:contracted_side_user)
        another_user.email = @contracted_side_user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @contracted_side_user.email = 'sample'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('メールアドレスは不正な値です', 'メールアドレスを正しく入力してください')
      end
      it 'パスワードが必須であること' do
        @contracted_side_user.password = ''
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードは、6文字以上での入力が必須であること(５文字で入力)' do
        @contracted_side_user.password = 'a1234'
        @contracted_side_user.password_confirmation = 'a1234'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @contracted_side_user.password = 'a12345'
        @contracted_side_user.password_confirmation = ''
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('Password confirmationとパスワードの入力が一致しません')
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @contracted_side_user.password = 'a12345'
        @contracted_side_user.password_confirmation = 'b12345'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('Password confirmationとパスワードの入力が一致しません')
      end
      it 'パスワードは英字のみでは登録できない' do
        @contracted_side_user.password = 'abcdef'
        @contracted_side_user.password_confirmation = 'abcdef'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
      it 'パスワードは数字のみでは登録できない' do
        @contracted_side_user.password = '123456'
        @contracted_side_user.password_confirmation = '123456'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
      it 'パスワードは全角では登録できない' do
        @contracted_side_user.password = '１２３４５６'
        @contracted_side_user.password_confirmation = '１２３４５６'
        @contracted_side_user.valid?
        expect(@contracted_side_user.errors.full_messages).to include('パスワードを正しく入力してください')
      end
    end
  end
  describe '新規登録/本人情報確認' do
    it '本名は、名字が必須であること' do
      @contracted_side_user.last_name = ''
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前（姓）を入力してください')
    end
    it '本名は、名前が必須であること' do
      @contracted_side_user.first_name = ''
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前（名）を入力してください')
    end
    it '本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること(半角の場合)' do
      @contracted_side_user.last_name = 'yamada'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前（姓）を正しく入力してください')
    end
    it '本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること(半角の場合)' do
      @contracted_side_user.first_name = 'taro'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前（名）を正しく入力してください')
    end
    it '本名のフリガナは、名字とが必須であること' do
      @contracted_side_user.last_name_ruby = ''
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（姓）を入力してください')
    end
    it '本名のフリガナは、名前が必須であること' do
      @contracted_side_user.first_name_ruby = ''
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（名）を入力してください')
    end
    it '本名のフリガナは、名字が全角（カタカナ）での入力が必須であること(全角平仮名の場合)' do
      @contracted_side_user.last_name_ruby = 'やまだ'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（姓）を正しく入力してください')
    end
    it '本名のフリガナは、名前が全角（カタカナ）での入力が必須であること(全角平仮名の場合)' do
      @contracted_side_user.first_name_ruby = 'たろう'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（名）を正しく入力してください')
    end
    it '本名のフリガナは、名字が全角（カタカナ）での入力が必須であること(半角の場合)' do
      @contracted_side_user.last_name_ruby = 'yamada'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（姓）を正しく入力してください')
    end
    it '本名のフリガナは、名前が全角（カタカナ）での入力が必須であること(半角の場合)' do
      @contracted_side_user.first_name_ruby = 'taro'
      @contracted_side_user.valid?
      expect(@contracted_side_user.errors.full_messages).to include('お名前カナ（名）を正しく入力してください')
    end
  end
end
