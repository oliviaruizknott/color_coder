class Review < ApplicationRecord
  RATINGS = [
    ["", ""],
    [1, "1"],
    [2, "2"],
    [3, "3"],
    [4, "4"],
    [5, "5"]
  ]

  validates :rating, inclusion: { in: 1..5, message: " must be between 1 - 5" }
  validates :body, presence: true

  belongs_to :user
  belongs_to :color
end
