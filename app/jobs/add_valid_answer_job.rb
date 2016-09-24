class AddValidAnswerJob < ApplicationJob

  def perform(answer_id, points)
    ActionCable.server.broadcast('familiada',
      action: 'ADD_VALID_ANSWER', answerId: answer_id, points: points
    )
  end

end
