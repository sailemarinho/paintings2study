class Artist < ApplicationRecord
  has_many :painting, dependent: :destroy
  validates :name, presence: true
end
