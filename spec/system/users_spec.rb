require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe User, type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'トップページの状態を確認する' do
    it 'ログインからログアウトまで' do
      # ログアウト状態では、ヘッダーに新規登録ボタンが表示される
      basic_pass root_path
      expect(page).to have_content('新規登録')
      # ログアウト状態では、ヘッダーにログインボタンが表示される
      expect(page).to have_content('ログイン')
      # ヘッダーの新規登録ボタンをクリックすることで、新規登録ページに遷移できる
      visit new_user_registration_path
      # ログイン状態では、ヘッダーにユーザーのニックネームボタンが表示される
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[last_name]', with: @user.last_name
      fill_in 'user[first_name]', with: @user.first_name
      fill_in 'user[last_name_k]', with: @user.last_name_k
      fill_in 'user[first_name_k]', with: @user.first_name_k
      select 1930, from: 'user[birthday(1i)]'
      select 1, from: 'user[birthday(2i)]'
      select 1, from: 'user[birthday(3i)]'
      find('input[name="commit"]').click
      expect(page).to have_content(@user.nickname)
      # ログイン状態では、ヘッダーにユーザーのログアウトボタンが表示される
      expect(page).to have_content('ログアウト')
      # ヘッダーのログアウトボタンをクリックすることで、ログアウトができる
      click_on 'ログアウト'
      # ヘッダーのログインボタンをクリックすることで、ログインページに遷移できる
      click_on 'ログイン'
    end
  end
end
