class Choice < ActiveRecord::Base
  validates :content, presence: :true
  belongs_to :question
end
