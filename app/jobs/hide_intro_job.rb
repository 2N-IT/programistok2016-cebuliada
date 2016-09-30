class HideIntroJob < ApplicationJob

  def perform
    ActionCable.server.broadcast('familiada',
      action: 'HIDE_INTRO'
    )
  end

end
