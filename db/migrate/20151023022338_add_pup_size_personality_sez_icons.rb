class AddPupSizePersonalitySezIcons < ActiveRecord::Migration
  def change
    add_column :pups, :personality, :string
  end
end
