class QuestionsController < ApplicationController
  # before_filter :redirect_to_root_if_no_user, only: [:show]
  before_filter :check_for_active_step, only: [:show]
  before_filter :initiaze_question, only: [:show]

  def show
    @current_user = current_user
    @description = @question.description
    @id = @question.id
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
