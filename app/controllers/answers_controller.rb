class AnswersController < ApplicationController
  before_filter :sanitize_answer, only: [:create]
  def create
    ans = current_user.answers.create({
      question_id: params[:question_id],
      answer: params[:choice]
    })
    if ans.invalid?
      flash[:error] = ans.errors.full_message
    end
    redirect_to question_path(current_user.active_question.id || 1)
  end

  private

  def sanitize_answer
    return if params[:choice]
    flash[:notice] = 'Please select an answer.'
    redirect_to question_path(current_user.active_question.id || 1)
  end
end
