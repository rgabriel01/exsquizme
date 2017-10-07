class Question < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 10 }
  validates :answer, presence: true
end