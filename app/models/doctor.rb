class Doctor < ApplicationRecord
  validates :name, :image, :location, :details, presence: true
end
