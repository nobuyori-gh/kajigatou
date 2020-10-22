class GroupRequestsController < ApplicationController

  # リクエスト送信アクション
  def create
    group = Group.find(params[:group_id])
    request = current_user.group_requests.new(group_id: group.id)
    request.save
    redirect_to groups_path
  end

  # リクエスト取消アクション
  def destroy
    group = Group.find(params[:id])
    request = current_user.group_requests.find_by(group_id: group.id)
    request.destroy
    redirect_to groups_path
  end

  # リクエスト承認アクション
  def allow
    request = GroupRequest.find(params[:id])
    group_user = GroupUser.new(group_user_params)
    group_user.save
    request.destroy
    redirect_to groups_path
  end

  # リクエスト否認アクション
  def reject
    request = GroupRequest.find(params[:id])
    request.destroy
    redirect_to groups_path
  end

private
  def group_user_params
    params.permit(:group_id, :user_id)
  end

end