class UsersController < ApplicationController


    def index
        @user = User.new
    end

    def new_guest
        user = User.find_or_create_by!(email: 'guest@example.com',username:'ゲスト') do |user|
          user.password = SecureRandom.urlsafe_base64
        end
        sign_in user
        redirect_to root_path
      end

end
