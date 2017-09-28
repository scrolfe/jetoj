class AddBranchToPerformersAndEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :performers, :branch, :integer
    add_column :events, :branch, :integer
  end
end
