class Color < ApplicationRecord
  validates :hex_code, length: { is: 6 }
end
