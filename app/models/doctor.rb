class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :image, presence: true
  validates :speciality, presence: true
  validates :location, presence: true
end
