class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[update destroy]
  before_action :set_user, only: %i[update destroy]
  before_action :authorized

  def index
    @appointments = if current_user.admin == true
                      Appointment.all
                    else
                      current_user.appointments
                    end
    appointment_serializer = parse_json @appointments
    json_response 'Showing Appointments', true, { appointment: appointment_serializer }, :ok
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    @appointment.doctor_id = params[:doctor_id]
    @appointment.username = current_user.username
    date = appointment_params[:date]
    if current_user.appointments.none? { |k| k[:date] == date }
      @appointment.save
      appointment_serializer = parse_json @appointment
      json_response 'Appointment Created', true, { appointment: appointment_serializer }, :ok
    else
      json_response 'Appointment date and time already exists!', false, {}, :bad_request
    end
  end

  def update
    if @user.id == @appointment.user_id
      @appointment.update(update_appointment_params)
      appointment_serializer = parse_json @appointment
      json_response 'Appointment updated!', true, { appointment: appointment_serializer }, :ok
    else
      json_response 'You are not allowed to perform that action', false, {}, :unauthorized
    end
  end

  def destroy
    if @user.id == @appointment.user_id
      @appointment.destroy
      head :no_content
    else
      json_response 'You are not allowed to perform that action', false, {}, :unauthorized
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :city, :username, :doctor_name, :doctor_id)
  end

  def update_appointment_params
    params.permit(:date)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
    return if @appointment.present?

    json_response 'Cannot get appointment', false, {}, :not_found
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
