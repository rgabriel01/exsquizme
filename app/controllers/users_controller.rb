class UsersController < ApplicationController
  skip_before_filter :redirect_to_root_if_no_user, only: [:create]
  def create
    user = User.find_or_create_by(name: user_params[:name])
    if user.invalid?
      flash[:error] = user.errors.full_messages.join(',')
      redirect_to root_path
      return
    else
      cookies[:user_id] = user.id
      redirect_to question_path(1)
    end
  end

  private

  def user_params
    @user_params ||= params[:user]
  end
end
