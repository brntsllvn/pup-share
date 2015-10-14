class SetPhoneDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :phone, ''
    change_column_default :users, :emergency_phone, ''
  end
end
