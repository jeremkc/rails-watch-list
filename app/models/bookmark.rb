class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # couple list/movie ne peut apparaitre qu'une fois
  validates :list, uniqueness: { scope: :movie }

  validates :comment, length: { minimum: 6 }
end
