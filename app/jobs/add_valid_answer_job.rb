class AddValidAnswerJob < ApplicationJob

  def perform(team, points)
    ActionCable.server.broadcast('familiada',
      action: 'ADD_VALID_ANSWER',team: team, points: points
    )
  end

end
