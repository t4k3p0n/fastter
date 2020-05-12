class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :following,:followers]
  def top
    @user  = current_user
    @users = @user.followings
    @posts = []
    if @users.present?
      @users.each do |user|
        posts = Post.where(user_id: user.id).order(created_at: :desc)
        #取得したユーザーの投稿一覧を@postsに格納
        @posts.concat(posts)
      end
       #@postsを新しい順に並べたい
        @posts.sort_by!{|post| post.created_at}
      end
end

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
