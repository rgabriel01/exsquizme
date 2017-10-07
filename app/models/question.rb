class Question < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 10 }
  validates :answer, presence: true
  validates_associated :choices
  has_many :choices

  def self.master_list
    all.map{|question| {id: question.id, description: question.description} }
  end
end