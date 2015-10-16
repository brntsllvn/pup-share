class ChangeMobile < ActiveRecord::Migration
  def change
    rename_column :phone_numbers, :mobile_number, :number
  end
end
