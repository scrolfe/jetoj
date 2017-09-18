class ChangePerformers < ActiveRecord::Migration[5.0]
  def change
    remove_column :performers, :location
    add_column :performers, :branch, :integer
  end
end
