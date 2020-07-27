class ThankYousController < ApplicationController

  def create
    group_task = GroupTask.find(params[:group_task_id])
    thank_you = current_user.thank_yous.new(group_task_id: group_task.id)
    thank_you.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    group_task = GroupTask.find(params[:group_task_id])
    thank_you = current_user.thank_yous.find_by(group_task_id: group_task.id)
    thank_you.destroy
    redirect_back(fallback_location: root_path)
  end

end
