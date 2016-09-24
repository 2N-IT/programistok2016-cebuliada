class ClearInvalidAnswersJob < ApplicationJob

  def perform
    ActionCable.server.broadcast('familiada',
      action: 'CLEAR_INVALID_ANSWERS'
    )
  end

end
