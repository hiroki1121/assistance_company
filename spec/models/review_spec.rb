require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    post = FactoryBot.create(:post)
    consignment_side_user = FactoryBot.create(:consignment_side_user)
    sleep 0.1
    @review = FactoryBot.build(:review, post_id: post.id, consignment_side_user_id: consignment_side_user.id)
  end
  describe 'レビュー投稿' do
    context '投稿できるとき' do
      it '正しく入力すると、レビュー投稿ができる' do
        expect(@review).to be_valid
      end
    end
    context '投稿できない' do
      it 'レビュー情報として、レビュータイトルが必須である' do
        @review.title = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('レビュータイトルを入力してください')
      end
      it 'レビュー情報として、評価が必須である' do
        @review.score = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('評価を入力してください')
      end
      it 'レビュー情報として、レビュー内容が必須である' do
        @review.comment = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('レビュー内容を入力してください')
      end
      it 'レビュー情報として、レビュー内容がは500文字までである' do
        @review.comment = Faker::Lorem.characters(number: 501)
        @review.valid?
        expect(@review.errors.full_messages).to include('レビュー内容は500文字以内で入力してください')
      end
    end
  end
end
