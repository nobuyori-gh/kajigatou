class GroupTasksController < ApplicationController

  # 新規タスク登録画面表示
  def new
    @group_task = GroupTask.new
    @group = Group.find(params[:group_id])
  end

  # タスクを保存
  def create
    @group_task = GroupTask.new(group_task_params)
    @group_task.user_id = current_user.id
    @group = Group.find(group_task_params[:group_id])
    if @group_task.save
      redirect_to group_path(@group), notice: "タスクを登録しました"
    else
      render 'new'
    end
  end

  def show
    @group_task = GroupTask.find(params[:id])
    @group_comment = GroupComment.new
  end

  def edit
    @group_task = GroupTask.find(params[:id])
    @group = @group_task.group
  end

  def update
    @group_task = GroupTask.find(params[:id])
    @group = @group_task.group
    if @group_task.update(group_task_params)
      redirect_to group_task_path(@group_task), notice: "タスク更新しました"
    else
      render "edit"
    end
  end

  def destroy
    group_task = GroupTask.find(params[:id])
    group_task.destroy
    redirect_to group_path(group_task.group_id), notice: "タスクを削除しました"
  end

private
def group_task_params
  params.require(:group_task).permit(:user_id,:group_id,:title,:body,:rep,:deadline,:status)
end

end
