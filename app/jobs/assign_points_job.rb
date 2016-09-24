class AssignPointsJob < ApplicationJob

  def perform(team, points)
    ActionCable.server.broadcast('familiada',
      action: 'ASSIGN_POINTS', team: team, points: points
    )
  end

end
