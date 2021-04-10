require 'rails_helper'

RSpec.describe Cosme, type: :model do
  before do
    @cosme = FactoryBot.build(:cosme)
    # sleep(1)
  end
  describe 'コスメ投稿の保存' do
    context 'コスメが投稿できる場合' do
      it '全ての情報が正しく入力されていれば、投稿できること' do
        expect(@cosme).to be_valid
      end
    end
  end

  context 'コスメが投稿できない場合' do
    it 'テキストが空では投稿できない' do
      @cosme.text = ''
      @cosme.valid?
      expect(@cosme.errors.full_messages).to include("Text can't be blank")
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @cosme.user = nil
      @cosme.valid?
      expect(@cosme.errors.full_messages).to include('User must exist')
    end

    it 'タイトルが空では投稿できない' do
      @cosme.title = ''
      @cosme.valid?
      expect(@cosme.errors.full_messages).to include("Title can't be blank")
    end

    it '商品画像が必須であること' do
      @cosme.image = nil
      @cosme.valid?
      expect(@cosme.errors.full_messages).to include("Image can't be blank")
    end
  end
end
