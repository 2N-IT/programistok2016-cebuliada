class CustomNotificationsController < ApplicationController

  def new
    AddCustomNotificationJob.perform_later(params[:content])
  end

end
