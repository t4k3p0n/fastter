# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show create destroy]
  def index
    @post = Post.new
    @posts = Post.all
  end

  def allpost
    @posts = Post.all.page(params[:page]).per(6)
    @post_ranking = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment = @post.comments.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to('/')
    else
      flash.now[:notic] = '投稿に失敗しました、ファイルを選択してください'
      render 'index'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if @post.user_id == current_user.id
      @post.destroy
      redirect_to('/')
    end
  end

  private

  def post_params
    params.require(:post).permit(:img, :remove_img)
  end
end
