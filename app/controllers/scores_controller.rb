class ScoresController < ApplicationController

  def assign
    AssignPointsJob.perform_later(params[:team], params[:points])
  end

end
