class UsersController < ApplicationController


    def new_guest
        user = User.find_or_create_by!(email: 'guest@example.com',username:'ゲスト') do |user|
          user.password = SecureRandom.urlsafe_base64
        end
        sign_in user
        redirect_to root_path
      end

      def show
        @user = User.find(params[:id])

      end

      def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render 'show_follow'
    end
  
    def followers
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follower'
    end
end
