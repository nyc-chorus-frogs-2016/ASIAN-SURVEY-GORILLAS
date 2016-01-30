class Survey < ActiveRecord::Base
 validates :creator_id, :title, :description, presence: :true
 belongs_to :creator, class_name: :User
 has_many :question_surveys, dependent: :destroy
 has_many :questions,through: :question_surveys
end
