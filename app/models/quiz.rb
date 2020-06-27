class Quiz < ApplicationRecord
  belongs_to :user
  validates :name, :description, :limit_time, presence: true
end
