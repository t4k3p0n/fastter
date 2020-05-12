class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
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
