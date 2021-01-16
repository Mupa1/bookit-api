class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :user_id, :doctor_id, :doctor_name, :location
end
