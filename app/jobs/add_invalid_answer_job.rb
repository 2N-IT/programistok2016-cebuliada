class AddInvalidAnswerJob < ApplicationJob

  def perform(team)
    ActionCable.server.broadcast('familiada',
      action: 'ADD_INVALID_ANSWER', team: team
    )
  end
end
