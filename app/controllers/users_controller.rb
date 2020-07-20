class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @group =Group.new
  end

  def edit
  end

  def update
  end

end
