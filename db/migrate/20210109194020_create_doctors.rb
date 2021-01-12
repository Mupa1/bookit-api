class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :image
      t.integer :location
      t.string :details
      
      t.timestamps
    end
  end
end
