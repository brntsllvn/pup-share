class AddWalkStatusIndicator < ActiveRecord::Migration
  def change
    add_column :walks, :status, :string
  end
end
