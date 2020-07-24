class GroupUsersController < ApplicationController

  # グループ脱退
  def destroy
    group_user = GroupUser.find(params[:id])
    group_user.destroy
    redirect_to user_path(current_user)
  end

  # グループ脱退確認
  def delete_confimation
    @group = Group.find(params[:id])
  end
end
