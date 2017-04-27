class Color < ApplicationRecord
  include PgSearch

  validates :hex_code, presence: true, uniqueness: true
  validates_format_of :hex_code, with: /#+([a-fA-F0-9]{6}|[a-fA-F0-9]{3})/, message: ": Please enter a valid hex code, including the starting '#'."

  pg_search_scope :search_color_only, against: [:hex_code, :nickname]

  scope :search, -> (query) { search_color_only(query) if query.present? }

  belongs_to :user
  has_many :reviews

  def brightness(color_string)
    red = ("0x"+color_string[1..2]).to_i(16)
    green = ("0x"+color_string[3..4]).to_i(16)
    blue = ("0x"+color_string[5..6]).to_i(16)
    luma=(0.33*red)+(0.5*green)+(0.16*blue)
  end

  def text_color(color_string)
    luma = brightness(color_string)
    if (luma > 128)
      return "#000000"
    else
      return "#FFFFFF"
    end
  end
end
