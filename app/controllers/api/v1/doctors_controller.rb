class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end

  def show
    @doctor = Doctor.find(params[:id])
    json_response(@doctor)
  end
end
