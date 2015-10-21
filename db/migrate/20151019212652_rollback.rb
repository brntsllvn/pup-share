class Rollback < ActiveRecord::Migration
  def change
    remove_column :phone_numbers, :number_normalized
  end
end
