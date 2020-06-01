require 'rails_helper'

RSpec.feature "Edits", type: :feature do
  background do
    # ユーザを作成する
    User.create!(email: 'foo@example.com',username:'hogehoge', password: '123456',password_confirmation: '123456')
  end
  scenario 'ログインする' do
    # ログインページを開く
    visit  new_user_session_path
    # ログインフォームにEmailとパスワードを入力する
    fill_in 'user_email', with: 'foo@example.com'
    fill_in 'user_password', with: '123456'
    # ログインボタンをクリックする
    click_on 'ログインする'
    # ログインに成功したことを検証する
    expect(page).to have_content 'タイムライン'

    # 設定ページを開く
    click_on '設定'
    #設定ページを開けたか検証する
    expect(page).to have_content 'アカウント情報の設定'

    fill_in 'user_email', with: 'fooo@example.com'
    fill_in 'user_username', with: 'hogehoge1'
    fill_in 'user_password', with: '1234567'
    fill_in 'user_password_confirmation', with: '1234567'
    fill_in 'user_current_password', with: '123456'
    click_on 'アカウント情報を更新'
    expect(page).to have_content 'タイムライン'
  end
end
