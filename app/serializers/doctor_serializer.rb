class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :image, :name, :speciality, :location
end
