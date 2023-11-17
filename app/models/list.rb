class List < ApplicationRecord
  # qd une liste est delete -> supp tous les bookmarks
  has_many :bookmarks, dependent: :destroy

  has_many :movies, through: :bookmarks

  has_one_attached :photo
  # list.movies

  validates :name, presence: true, uniqueness: true
end
