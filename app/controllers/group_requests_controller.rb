class GroupRequestsController < ApplicationController

  def index
    # グループメンバー一覧
    @group_users = Group.users.all
    # リクエスト一覧
    @requests = group.group_requests.all
  end

  # リクエスト送信アクション
  def create
    group = Group.find(params[:group_id])
    request = current_user.group_request.new(group_id: group.id, user_id: current_user.id)
    request.save
    redirect_back(fallback_lacation: root_path)
  end

  # リクエスト取消アクション
  def destroy
    group = Group.find(params[:group_id])
    request = current_user.group_request.find_by(group_id: group.id, user_id: current_user.id)
    request.destroy
    redirect_back(fallback_lacation: root_path)
  end

  # リクエスト承認されたらGroupUserに保存
  def allow
    request = GroupRequest.find(arams[:id])
    user = User.find_by(id:request.user_id)
    group_user = Group.group_users.new(group_id:group.id, user_id:user.id)
    group_user.save
    request.destroy
    redirect_back(fallback_lacation root_path)
  end

  # リクエスト否認アクション
  def reject
    request = GroupRequest.find(params[:id])
    request.destroy
    redirect_back(fallback_lacation: root_path)
  end
end
