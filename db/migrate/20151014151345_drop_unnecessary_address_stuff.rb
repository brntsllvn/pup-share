class DropUnnecessaryAddressStuff < ActiveRecord::Migration
  def change
    remove_column :walks, :street
    remove_column :walks, :city
    remove_column :walks, :zip
    remove_column :walks, :state
    add_column :walks, :full_street_address, :string
  end
end
