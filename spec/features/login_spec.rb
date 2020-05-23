require 'rails_helper'

RSpec.feature "Logins", type: :feature do
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
  end
end
