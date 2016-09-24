class AnswersController < ApplicationController

  def index
    @answers = question.answers
  end

  def valid
    AddValidAnswerJob.perform_later(team, points)
    head :ok
  end

  def invalid
    AddInvalidAnswerJob.perform_later(team)
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
