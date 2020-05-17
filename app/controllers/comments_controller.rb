class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy,:correct_user]
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @post = @comment.post
        if @comment.save
          @post.create_notification_comment!(current_user, @comment.id)
          redirect_back(fallback_location: root_path)
        else
          redirect_back(fallback_location: root_path)
        end
    end
    
    def destroy
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
      redirect_to("/")
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      unless @comment
        redirect_to root_url
      end
    end
    
      private
    
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
