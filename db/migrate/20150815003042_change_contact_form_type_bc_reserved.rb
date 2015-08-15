class ChangeContactFormTypeBcReserved < ActiveRecord::Migration
  def change
    rename_column :contact_forms, :type, :contact_type
  end
end
