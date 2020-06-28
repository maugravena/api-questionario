class Answer < ApplicationRecord
  belongs_to :question
  validates :description, :correct,presence: true
end
