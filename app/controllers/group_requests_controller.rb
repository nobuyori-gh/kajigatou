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
    byebug
    group = Group.find(params[:id])
    request = current_user.group_requests.find_by(group_id: group.id, user_id: current_user.id)
    request.destroy
    redirect_to groups_path
  end

  # リクエスト承認アクション
  def allow
    request = GroupRequest.find(params[:id])
    user = User.find_by(id:request.user_id)

    group = Group.find(params[:group_id])

    group_user = group.group_users.new(group_id:group.id, user_id:user.id)

    group_user.save
    request.destroy
    redirect_to groups_path
    # redirect_back(fallback_lacation: root_path)
  end

  # リクエスト否認アクション
  def reject
    request = GroupRequest.find(params[:id])
    request.destroy
    redirect_to groups_path
    # redirect_to group_member_path(id:group_id)
  end
end
