class NotificationsController < ApplicationController

  def new
    AddCustomNotificationJob.perform_async(template)
  end

  private

  def template
    ApplicationController.render file: 'notifications/new'
  end
end
