class DropEndTimeRedundant < ActiveRecord::Migration
  def change
    remove_column :walks, :end_time
    remove_column :pups, :age
    remove_column :pups, :vet_name
    remove_column :offers, :status
    remove_column :pups, :care_instructions
    add_column :walks, :message, :text
  end
end
