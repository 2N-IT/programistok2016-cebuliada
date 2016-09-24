class AddValidAnswerJob < ApplicationJob

  def perform(team, points, answer_id)
    ActionCable.server.broadcast('familiada',
      action: 'ADD_VALID_ANSWER',team: team, points: points, answerId: answer_id
    )
  end

end
