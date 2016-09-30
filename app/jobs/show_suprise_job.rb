class ShowSupriseJob < ApplicationJob

  def perform
    ActionCable.server.broadcast('familiada',
      action: 'SHOW_SUPRISE'
    )
  end

end
