class AddImageToMedia < ActiveRecord::Migration[5.0]
  def up
    add_attachment :media, :image
  end

  def down
    remove_attachment :media, :image
  end
end
