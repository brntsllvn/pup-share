class RemovePupWeight < ActiveRecord::Migration
  def change
    remove_column :pups, :pup_weight
  end
end
