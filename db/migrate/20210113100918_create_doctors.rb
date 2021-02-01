class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :image
      t.string :speciality
      t.string :location

      t.timestamps
    end
  end
end
