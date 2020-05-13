class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show, :create,:destroy]
  def index
    @post = Post.new
    @posts = Post.all
  end

  def allpost
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if @post.user_id == current_user.id
    @post.destroy
    redirect_to("/")
    else
      flash.now[:alert] = '投稿者のみ削除できます'
    end
  end

  
  private
  def post_params
    params.require(:post).permit(:img, :remove_img)
  end

  
end