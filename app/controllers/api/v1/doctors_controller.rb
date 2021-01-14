class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  before_action :set_doctor, only: %i[show update destroy]
  # before_action :authorized

  def index
    @doctors = Doctor.all
    doctor_serializer = parse_json @doctors
    json_response 'Showing Doctors', true, { doctor: doctor_serializer }, :ok
  end

  def show
    @doctor = Doctor.find(params[:id])
    doctor_serializer = parse_json @doctor
    json_response 'Showing Doctor Details', true, { doctor: doctor_serializer }, :ok
  end

  def create
    @user = User.find(params[:user_id])
    if @user.admin == true
      @doctor = @user.doctors.create(doctor_params)
      doctor_serializer = parse_json @doctor
      if @doctor.valid?
        json_response 'Doctor created!', true, { doctor: doctor_serializer }, :ok
      else
        json_response @doctor.errors, false, {}, :bad_request
      end
    else
      json_response 'You are not an admin', false, {}, :unauthorized
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.permit(:name, :image, :speciality, :location, :user_id)
  end
end
