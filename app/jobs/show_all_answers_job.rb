class ShowAllAnswersJob < ApplicationJob

  def perform
    ActionCable.server.broadcast('familiada',
      action: 'SHOW_ALL_ANSWERS'
    )
  end
end
