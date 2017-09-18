class CreatePerformers < ActiveRecord::Migration[5.0]
  def change
    create_table :performers do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.references :user, index: true, foreign_key: true
      t.attachment :headshot

      t.timestamps
    end
  end
end
