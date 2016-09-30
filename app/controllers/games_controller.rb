class GamesController < ApplicationController

  def custom_notification
    AddCustomNotificationJob.perform_later(params[:content])
  end

  def hide_intro
    HideIntroJob.perform_later
  end

  def show_suprise
    ShowSupriseJob.perform_later
  end

  def change_name
    ChangeNameJob.perform_later(params[:team], params[:value])
  end
end
