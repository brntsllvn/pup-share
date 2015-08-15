class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :type
      t.text :comment

      t.timestamps null: false
    end
  end
end
