# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do
  scenario 'ログインする' do
    # 新規登録ページを開く
    visit  new_user_registration_path
    # フォームにemail,username,passwordを入力する
    fill_in 'user_email', with: 'foo@example.com'
    fill_in 'user_username', with: 'hogehoge'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    # アカウント作成ボタンをクリックする
    click_on 'アカウント作成'
    # ログインに成功したことを検証する
    expect(page).to have_content 'タイムライン'
  end
end
