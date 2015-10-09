class AddLocDetailsToWalk < ActiveRecord::Migration
  def change
    add_column :walks, :address_desk, :string
    add_column :walks, :address_building, :string
    add_column :walks, :address_neighborhood, :string
    add_column :walks, :address_street, :string
    add_column :walks, :address_city, :string
    add_column :walks, :address_zip_code, :string
    add_column :walks, :address_state, :string
    add_column :walks, :address_country, :string
    remove_column :users, :address_desk
    remove_column :users, :address_building
    remove_column :users, :address_street
    remove_column :users, :address_city
    remove_column :users, :address_zip_code
    remove_column :users, :address_state
    remove_column :users, :address_country  
  end
end
