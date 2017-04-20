class Color < ApplicationRecord
  validates :hex_code, presence: true, length: { maximum: 7 }, uniqueness: true

  belongs_to :user
  has_many :reviews
end
