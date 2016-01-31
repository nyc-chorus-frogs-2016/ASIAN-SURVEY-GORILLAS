class Answer < ActiveRecord::Base
 validates :taker_id, :survey_id, :choice_id, presence: :true
  belongs_to :choice
  belongs_to :survey
  belongs_to :taker, class_name: :User
  has_one :question, :through => :choice

  validates_uniqueness_of :taker_id, :scope => :choice
end

