class User < ActiveRecord::Base
  has_many :answers
  validates :name, presence: true
  validates_associated :answers
end