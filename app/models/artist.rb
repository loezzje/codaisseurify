class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :songs, dependent: :destroy
  has_one :photo, dependent: :destroy


end
