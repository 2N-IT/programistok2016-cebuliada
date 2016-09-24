class ShowAllAnswersJob < ApplicationJob

  def perform(team)
    ActionCable.server.broadcast('familiada',
      action: 'SHOW_ALL_ANSWERS'
    )
  end
end
