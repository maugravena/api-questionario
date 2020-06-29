class User < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  validates :name, :email, presence: true
end
