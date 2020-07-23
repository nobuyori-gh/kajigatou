class GroupUsersController < ApplicationController

  # ユーザーグループ脱退
  def destroy
    group_user = GroupUser.find(params[:id])
    group_user.destroy
    redirect_back(fallback_location: root_path)
  end
end
