class CommentsController < ApplicationController
  before_action :correct_user, only: [:destroy]
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
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
