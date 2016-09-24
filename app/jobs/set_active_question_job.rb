class SetActiveQuestionJob < ApplicationJob

  def perform(question_id)
    @question_id = question_id
    ActionCable.server.broadcast('familiada',
      action: 'SET_ACTIVE_QUESTION', answers: answers, question: question
    )
  end

  private

  def question
    Question.find(@question_id)
  end

  def answers
    question.answers.order(points: :desc)
  end
end
