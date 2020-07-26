class GroupRequestsController < ApplicationController

  # リクエスト送信アクション
  def create
    group = Group.find(params[:group_id])
    request = current_user.group_requests.new(group_id: group.id, user_id: current_user.id)

    request.save
    redirect_to groups_path
  end

  # リクエスト取消アクション
  def destroy
    group = Group.find(params[:id])
    request = current_user.group_requests.find_by(group_id: group.id, user_id: current_user.id)
    request.destroy
    redirect_to groups_path
  end

  # リクエスト承認されたらGroupUserに保存
  def allow
    request = GroupRequest.find(params[:id])
    user = User.find_by(id:request.user_id)
    group_user = Group.group_users.new(group_id:group.id, user_id:user.id)
    group_user.save
    request.destroy
    redirect_to groups_path
  end

  # リクエスト否認アクション
  def reject
    request = GroupRequest.find(params[:id])
    request.destroy
    redirect_back(fallback_lacation: root_path)
  end
end
