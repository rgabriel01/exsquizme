class User < ActiveRecord::Base
  has_many :answers
  validates :name, presence: true
  validates_associated :answers

  def active_question
    return Question.first unless answers.present?
    return Question.last if Question.count == answers.count
    q_id = answers.order(question_id: :desc).pluck(:question_id).first + 1
    max_questions = Question.count
    Question.find_by(id: q_id)
  end
end