class AddPhone < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :mobile_number
      t.integer :owner_id

      t.timestamps null: false
    end
    add_timestamps :locations
    remove_column :users, :mobile
    remove_column :walks, :mobile
    add_column :walks, :phone_number_id, :integer
  end
end
