class Question < ActiveRecord::Base
  validates :content, presence: :true
  has_many :question_surveys
  has_many :surveys, through: :question_surveys
  has_many :choices
end
