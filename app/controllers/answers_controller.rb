class AnswersController < ApplicationController

  def index
    @answers = question.answers
  end

  def valid
    ActionCable.server.broadcast('familiada',
      action: 'ADD_VALID_ANSWER',team: team, points: points
    )
    head :ok
  end

  def invalid
    ActionCable.server.broadcast('familiada',
      action: 'ADD_INVALID_ANSWER', team: team
    )
    head :ok
  end

  def clear
    ActionCable.server.broadcast('familiada',
      action: 'CLEAR_INVALID_ANSWERS'
    )
    head :ok
  end

  private

  def question
    @question ||= Question.find(params[:question_id])
  end

  def answer
    @answer ||= Answer.find(params[:id])
  end

  def team
    params[:team]
  end

  def points
    answer.points
  end
end
