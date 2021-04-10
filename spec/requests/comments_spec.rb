require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before do
    @comment = FactoryBot.create(:cosme)
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get cosme_path(@comment)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのコスメのコメントが存在する' do
      get cosme_path(@comment)
      expect(response.body).to include(@comment.text)
    end
  end
end
