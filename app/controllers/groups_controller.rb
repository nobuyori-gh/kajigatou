class GroupsController < ApplicationController

  # グループ一覧
  def index
    @group = Group.new
    @groups = Group.all
  end

  # グループユーザー一覧
  def member
    @group = Group.find(params[:id])
    @group_users = @group.users.all
  end

  def show
    @group = Group.find(params[:id])
  end

  # グループ作成と作成者をグループユーザーとして保存
  def create
    group = Group.new(group_params)
    if group.save
      group_user = group.group_users.new(group_id:group.id, user_id:current_user.id)
      group_user.save
      redirect_to group_path(group), notice: "保存できました"
    else
      redirect_back(fallback_lacation: root_path)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name,:description,:image_id)
  end
end
