class ShowQuestionTitleJob < ApplicationJob

  def perform
    ActionCable.server.broadcast('familiada',
      action: 'SHOW_QUESTION_TITLE'
    )
  end

end
