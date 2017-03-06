class AnswersController < ApplicationController

  def valid
    AddValidAnswerJob.perform_later(answer.id, answer.points)
    render json: {points: answer.points}
  end

  def invalid
    AddInvalidAnswerJob.perform_later(params[:team])
    render nothing: true
  end

  private

  def answer
    @answer ||= Answer.find(params[:id])
  end

end
