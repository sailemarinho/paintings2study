class Painting < ApplicationRecord
  belongs_to :artist
  validades :name, uniqueness: true, presence: true
end
