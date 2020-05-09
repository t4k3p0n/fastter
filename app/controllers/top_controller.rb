class TopController < ApplicationController
    def index
        @users = User.all
        @q = User.ransack(params[:q])
        @user = @q.result(distinct: true)
      end

    def show
    @users = User.all
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true)
    end

end
