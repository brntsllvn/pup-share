class AddAddressesTable < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :desk
      t.string  :building
      t.string  :full_street_address
      t.float   :latitude
      t.float   :longitude
      t.integer :walk_id
      t.integer :owner_id
    end
  end
end
