class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :redirect_to_root_if_no_user
  before_filter :redirect_to_summary_page
  private

  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id])
  end

  def redirect_to_root_if_no_user
    return if request.path == "/"
    redirect_to root_path unless current_user.present?
  end

  # redirect to summary page if user completed the quiz
  def redirect_to_summary_page
    return if request.path == "/answer_summary"
    return if current_user.blank?
    redirect_to answer_summary_index_path if Question.count == current_user.answers.count
  end
end