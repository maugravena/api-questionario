class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions
  validates :name, :description, :limit_time, presence: true, uniqueness: { scope: :user_id }
end
