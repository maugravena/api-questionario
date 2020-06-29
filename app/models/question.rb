class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :quiz
  accepts_nested_attributes_for :answers, limit: 5
  validates :description, :points, presence: true
end
