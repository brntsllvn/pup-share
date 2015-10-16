class AddPhoneType < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :type, :string
  end
end
