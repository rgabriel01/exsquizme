class Answer < ActiveRecord::Base
  validates :user_id, presence: true
  validates :question_id, presence: true
  belongs_to :user

  def self.master_list
    hash = {}
    all.each do |answer|
      key = answer.question_id.to_s
      hash[key] = [] if hash[key].blank?
      hash[key].push({
        name: User.find_by(id: answer.user_id).name,
        value: answer.answer
      })
    end
    hash
  end
end
