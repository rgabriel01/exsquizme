class Choice < ActiveRecord::Base
  validates :question_id, presence: true
  validates :value, presence: true
  belongs_to :question
end