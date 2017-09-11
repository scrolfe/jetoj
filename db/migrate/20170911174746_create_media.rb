class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :youtube_id
      t.text :description

      t.timestamps
    end
  end
end
