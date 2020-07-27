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
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
def group_task_params
  params.require(:group_task).permit(:user_id,:group_id,:title,:body,:rep,:deadline,:status)
end

end
