class Review < ApplicationRecord
  validates :rating, inclusion: { in: 1..5, message: " must be between 1 - 5" }
  validates :body, presence: true

  belongs_to :user
  belongs_to :color
end
