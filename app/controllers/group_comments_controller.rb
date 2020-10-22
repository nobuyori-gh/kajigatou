class GroupCommentsController < ApplicationController

  def create
    @group_task = GroupTask.find(params[:group_task_id])
    comment = GroupComment.new(group_comment_params)
    comment.user_id = current_user.id
    comment.group_task_id = @group_task.id
    comment.save
  end

  def destroy
    @group_task = GroupTask.find(params[:group_task_id])
    comment = GroupComment.find(params[:id])
    comment.destroy
  end

  private
  def group_comment_params
    params.require(:group_comment).permit(:comment)
  end
end
