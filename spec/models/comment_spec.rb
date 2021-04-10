require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
    # sleep(1)
  end
  describe 'コメント投稿の保存' do
    context 'コメントが投稿できる場合' do
      it '全ての情報が正しく入力されていれば、投稿できること' do
        expect(@comment).to be_valid
      end
    end
  end

  context 'コメントが投稿できない場合' do
    it 'テキストが空では投稿できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('User must exist')
    end
    it 'コスメが紐付いていなければ投稿できない' do
      @comment.cosme = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include('Cosme must exist')
    end
  end
end
