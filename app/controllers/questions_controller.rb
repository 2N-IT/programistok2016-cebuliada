class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = question
    SetActiveQuestionJob.perform_later(question.id)
    ClearInvalidAnswersJob.perform_later
  end

  private

  def question
    @question ||= Question.find(params[:id])
  end

end
