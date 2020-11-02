class GroupsController < ApplicationController

  # グループ一覧表示
  def index
    @group = flash[:group]? Group.new(flash[:group]) : Group.new
    @groups = Group.page(params[:page]).reverse_order
  end

  # グループユーザ＆入会リクエスト一覧表示
  def member
    @group = Group.find(params[:id])
    @group_users = @group.users

    @group_requests = @group.group_requests
  end

  # グループ詳細表示
  def show
    @group = Group.find(params[:id])
    @group_tasks = @group.group_tasks
  end

  # グループ作成と同時に作成者をグループユーザーとして保存
  def create
    @group = Group.new(group_params)
    if @group.save
      group_user = @group.group_users.new(group_id:@group.id, user_id:current_user.id)
      group_user.save
      redirect_to group_path(@group), notice: "保存できました"
    else
      if request.referer.include?(user_path(current_user))
        redirect_to user_path(current_user.id), flash:{error:group.errors.full_messages,group:group}
      else
        redirect_to groups_path, flash:{error:group.errors.full_messages,group:group}
      end
    end
  end

  # グループ編集画面表示
  def edit
    @group = Group.find(params[:id])
  end

  # グループ情報を更新
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group), notice: "更新完了"
    else
      render "edit"
    end
  end

  # グループ削除確認画面表示
  def delete_confimation
    @group = Group.find(params[:id])
  end

  # グループを削除
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name,:description,:image)
  end
end
