class UsersController < ApplicationController

  def index
    @users = User.all
    authenticate @users
  end

  def show
    @user = User.find(params[:id])
    authenticate @user
  end

end
