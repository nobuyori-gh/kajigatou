class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @mygroup = @user.groups
    @group_user = @user.group_users.find_by(group_id: @mygroup)
    @group = Group.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新完了"
    else
      render "edit"
    end
  end

  def delete_confimation
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user). permit(:name,:introduction,:email,:image)
  end
end
