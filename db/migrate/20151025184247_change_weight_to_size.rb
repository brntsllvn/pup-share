class ChangeWeightToSize < ActiveRecord::Migration
  def change
    rename_column :pups, :weight, :size
  end
end
