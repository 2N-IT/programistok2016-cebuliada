class AnswersController < ApplicationController

  def valid
    @answer = answer
    AddValidAnswerJob.perform_later(@answer.id, @answer.points)
  end

  def invalid
    @team = team
    AddInvalidAnswerJob.perform_later(team)
  end

  def show_all
    ShowAllAnswersJob.perform_later
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
end
