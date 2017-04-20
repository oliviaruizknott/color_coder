class Color < ApplicationRecord
  validates :hex_code, presence: true, uniqueness: true
  validates_format_of :hex_code, with: /#+([a-fA-F0-9]{6}|[a-fA-F0-9]{3})/, message: ": Please enter a valid hex code, including the starting '#'."

  belongs_to :user
  has_many :reviews
end
