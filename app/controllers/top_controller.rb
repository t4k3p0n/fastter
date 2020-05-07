class TopController < ApplicationController
    def index
        @users = User.all
        
      end

    def show
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true)
    end

end
