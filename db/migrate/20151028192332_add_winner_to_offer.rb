class AddWinnerToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :winner, :boolean
  end
end
