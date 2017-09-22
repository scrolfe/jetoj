class ChangeEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :location
    add_column :events, :address, :hstore
  end
end
