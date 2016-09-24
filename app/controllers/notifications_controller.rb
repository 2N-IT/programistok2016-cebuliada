class CustomNotificationsController < ApplicationController

  def new
    AddCustomNotificationJob.perform_later(template)
  end

  private

  def template
    ApplicationController.render file: 'notifications/new'
  end
end
