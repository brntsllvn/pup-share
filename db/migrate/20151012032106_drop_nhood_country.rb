class DropNhoodCountry < ActiveRecord::Migration
  def change
    remove_column :walks, :address_neighborhood
    remove_column :walks, :address_country
    rename_column :walks, :address_desk, :desk
    rename_column :walks, :address_building, :building
    rename_column :walks, :address_street, :street
    rename_column :walks, :address_city, :city
    rename_column :walks, :address_zip_code, :zip
    rename_column :walks, :address_state, :state
  end
end
