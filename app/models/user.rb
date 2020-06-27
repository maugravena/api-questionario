class User < ApplicationRecord
  has_many :quizzes
  validates :name, :email, presence: true
end
