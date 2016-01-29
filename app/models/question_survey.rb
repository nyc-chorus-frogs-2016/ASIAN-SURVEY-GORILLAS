class QuestionSurvey < ActiveRecord::Base
  validates :survey_id, :question_id, presence: :true
  belongs_to :survey
  belongs_to :question
end
