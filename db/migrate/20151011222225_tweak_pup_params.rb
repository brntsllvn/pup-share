class TweakPupParams < ActiveRecord::Migration
  def change
    remove_column :pups, :vet_phone
    remove_column :pups, :insurance_provider
    add_column :pups, :age, :integer
    add_column :pups, :weight, :integer
  end
end
