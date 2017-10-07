class AnswerSummaryController < ApplicationController
  def index
    @question_master_list = Question.master_list
    @answer_master_list = Answer.master_list
  end
end