class RenameLocationToCity < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :location, :city
  end
end
