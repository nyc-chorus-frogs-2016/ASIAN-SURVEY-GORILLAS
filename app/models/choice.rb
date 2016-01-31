class Choice < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :question
  has_many :answers
  has_one :survey, through: :question_survey
  has_one :question_survey, through: :question
  has_one :creator, through: :survey

end
