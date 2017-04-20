class Color < ApplicationRecord
  validates :hex_code, length: { is: 6 }

  belongs_to :user
  has_many :reviews
end
