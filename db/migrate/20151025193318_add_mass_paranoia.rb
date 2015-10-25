class AddMassParanoia < ActiveRecord::Migration
  def change
    add_column :pups, :deleted_at, :datetime
    add_index :pups, :deleted_at
    add_column :locations, :deleted_at, :datetime
    add_index :locations, :deleted_at
    add_column :phone_numbers, :deleted_at, :datetime
    add_index :phone_numbers, :deleted_at
    add_column :offers, :deleted_at, :datetime
    add_index :offers, :deleted_at
    add_column :walks, :deleted_at, :datetime
    add_index :walks, :deleted_at
  end
end
