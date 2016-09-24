class AssignScoresController < ApplicationController

  def new
    @team = team
    @points = points
    AssignPointsJob.perform_later(@team, @points)
  end

  private

  def team
    params[:team]
  end

  def points
    params[:points]
  end

end
