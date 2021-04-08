require 'rails_helper'

RSpec.describe Cosme, type: :model do  
  before do
    @cosme = FactoryBot.build(:cosme)
  end
  describe 'コスメ投稿の保存' do
    context 'コスメが投稿できる場合' do
      it '全ての情報が正しく入力されていれば、出品できること' do
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
      end

      it 'タイトルが空では投稿できない' do
      end

    end
  end
