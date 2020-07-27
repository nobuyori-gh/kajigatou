class GroupCommentsController < ApplicationController

  def create
    group_task = GroupTask.find(params[:group_task_id])
    comment = GroupComment.new(group_domment_params)
    comment.user_id = current_user.id
    comment.group_task_id = group_task.id

    comment.save
    redirect_to group_task_path(group_task)
  end

  def destroy
    GroupComment.find_by(id: params[:id], group_task_id: params[:group_task_id]).destroy
    redirect_to group_task_path(params[:group_task_id])
  end

  private
  def group_domment_params
    params.require(:group_comment).permit(:comment)
  end
end
