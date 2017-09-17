class AddMediumTypeToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :medium_type, :integer
  end
end
