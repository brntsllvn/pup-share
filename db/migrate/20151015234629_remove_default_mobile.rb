class RemoveDefaultMobile < ActiveRecord::Migration
  def change
    change_column_default :users, :mobile, nil
  end
end
