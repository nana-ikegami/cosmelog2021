require 'rails_helper'

RSpec.describe 'コスメ投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @cosme = FactoryBot.create(:cosme)
  end

  context 'コスメ投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_cosme_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('cosme[image]', image_path)
      # フォームに情報を入力する
      fill_in 'cosme_text', with: @cosme.text
      fill_in 'cosme_title', with: @cosme.title
      # 送信するとCosmeモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Cosme.count }.by(1)
      # トップページに遷移する
      visit root_path
      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容のコスメが存在することを確認する（テキスト）
      expect(page).to have_content(@cosme_text)
      # トップページには先ほど投稿した内容のコスメが存在することを確認する（タイトル）
      expect(page).to have_content(@cosme_title)
    end
  end
  context 'コスメ投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end
