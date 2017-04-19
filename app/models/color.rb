class Color < ApplicationRecord
  validates :hex_code, length: { is: 6 }

  has_many :reviews
end
