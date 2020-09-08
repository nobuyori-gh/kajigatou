class RemindMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.remind_mailer.remind.subject
  #
  def remind(user)
    @user = User.find_by(id: user)
    @group_tasks = @user.group_tasks
    @today_group_tasks = @group_tasks.todays_task?
    mail(to: @user.email, subject: "[#{Date.today}]のリマインド")
  end
end
