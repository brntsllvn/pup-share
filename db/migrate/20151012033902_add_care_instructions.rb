class AddCareInstructions < ActiveRecord::Migration
  def change
    add_column :pups, :additional_info, :text
  end
end
