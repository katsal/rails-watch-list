class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, :overview, uniqueness: true, presence: true

  def to_label
    title.capitalize
  end
end
