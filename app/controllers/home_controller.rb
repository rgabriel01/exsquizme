class HomeController < ApplicationController
  before_filter :redirect_when_with_current_user, only: [:index]

  def index
  end

  private

  def redirect_when_with_current_user
    redirect_to question_path(current_user.active_question.id || 1) if current_user.present?
  end
end