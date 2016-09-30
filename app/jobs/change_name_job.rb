class ChangeNameJob < ApplicationJob

  def perform(team, value)
    ActionCable.server.broadcast('familiada',
      action: 'CHANGE_NAME', team: team, value: value
    )
  end

end
