class Color < ApplicationRecord
  include PgSearch

  validates :hex_code, presence: true, uniqueness: true
  validates_format_of :hex_code, with: /#+([a-fA-F0-9]{6}|[a-fA-F0-9]{3})/, message: ": Please enter a valid hex code, including the starting '#'."

  pg_search_scope :search_color_only, against: [:hex_code, :nickname]

  scope :search, -> (query) { search_color_only(query) if query.present? }

  belongs_to :user
  has_many :reviews
end
