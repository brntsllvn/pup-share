class AddWalkStartedEndIndicators < ActiveRecord::Migration
  def change
    remove_column :walks, :status
    add_column    :walks, :owner_started,  :string, default: false
    add_column    :walks, :walker_started, :string, default: false
    add_column    :walks, :owner_ended,    :string, default: false
    add_column    :walks, :walker_ended,   :string, default: false
  end
end
