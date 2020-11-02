class UsersController < ApplicationController

  def show
    @group = flash[:group]? Group.new(flash[:group]) : Group.new
    @user = User.find(params[:id])
    # @mygroup = @user.groups
    @mygroup = @user.groups.page(params[:page]).reverse_order
    @group_user = @user.group_users.find_by(group_id: @mygroup)
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
