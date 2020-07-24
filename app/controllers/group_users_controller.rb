class GroupUsersController < ApplicationController

  # グループ脱退確認画面表示
  def delete_confimation
    @group_user = GroupUser.find(params[:id])
  end

  # グループ脱退
  def destroy
    group_user = GroupUser.find(params[:id])
    group_user.destroy
    redirect_to user_path(current_user)
  end

end
