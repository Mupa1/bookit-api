class AddUsernameToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :username, :string
  end
end
