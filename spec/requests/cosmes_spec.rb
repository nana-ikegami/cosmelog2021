require 'rails_helper'

RSpec.describe 'Cosmes', type: :request do
  before do
    @cosme = FactoryBot.create(:cosme)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのコスメのタイトルが存在する' do
      get root_path
      expect(response.body).to include(@cosme.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのコスメのパーソナルカラーが存在する' do
      get root_path
      expect(response.body).to include(@cosme.personalcolor.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do
      get root_path
      expect(response.body).to include('検索')
    end
  end
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get cosme_path(@cosme)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのコスメのタイトルが存在する' do
      get cosme_path(@cosme)
      expect(response.body).to include(@cosme.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのコスメのパーソナルカラーが存在する' do
      get cosme_path(@cosme)
      expect(response.body).to include(@cosme.personalcolor.name)
    end
  end
end
