class AddCustomNotificationJob < ApplicationJob

  def perform(question_id)
    @question_id = question_id
    ActionCable.server.broadcast('familiada',
      action: 'SET_ACTIVE_QUESTION', answers: answers, question: question
    )
  end

end
