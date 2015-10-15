class AddMobileToWalk < ActiveRecord::Migration
  def change
    add_column :walks, :mobile, :string
  end
end
