class User < ActiveRecord::Base
  validates :username, presence: :true
  validates :username, uniqueness: true
  has_many :surveys, foreign_key: :creator_id
  has_many :answers, foreign_key: :taker_id

include BCrypt
def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end


