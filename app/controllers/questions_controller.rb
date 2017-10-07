class QuestionsController < ApplicationController
  before_filter :initiaze_question, only: [:show]
  before_filter :check_for_active_step, only: [:show]

  def show
    @description = @question.description
    @choices = @question.choices
  end

  private

  def initiaze_question
    @question = Question.find_by(id: params[:id])
  end

  def check_for_active_step
    active_question = current_user.active_question
    return if active_question.id == params[:id].to_i
    redirect_to question_path(active_question.id || 1)
  end
end
