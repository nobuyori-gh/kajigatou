class GroupUsersController < ApplicationController

  def index
  end

  def show
  end

  # ユーザーグループ脱退
  def destroy
    group_user = GroupUser.find(params[:id])
    group_user.destroy
    redirect_to user_path(current_user)
  end

  def delete_confimation
    @user = User.find(params[:id])
  end
end
