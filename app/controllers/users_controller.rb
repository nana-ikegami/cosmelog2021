class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cosmes = @user.cosmes
  end
end
