class ChangeToMobile < ActiveRecord::Migration
  def change
    remove_column :users, :emergency_phone
    rename_column :users, :phone, :mobile
  end
end
