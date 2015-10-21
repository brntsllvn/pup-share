class NormalizedPhone < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :number_normalized, :string
  end
end
