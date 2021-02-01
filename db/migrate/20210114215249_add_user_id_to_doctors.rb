class AddUserIdToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :user_id, :integer
  end
end
