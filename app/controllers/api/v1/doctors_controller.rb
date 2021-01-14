class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user, only: %i[show]

  def index
    doctors = Doctor.all
    doctor_serializer = parse_json doctors
    json_response 'Showing Doctors', true, { doctor: doctor_serializer }, :ok
  end

  def show
    doctor = Doctor.find(params[:id])
    doctor_serializer = parse_json doctor
    json_response 'Showing Doctor Details', true, { doctor: doctor_serializer }, :ok
  end
end
