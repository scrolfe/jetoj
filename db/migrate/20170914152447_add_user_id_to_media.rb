class AddUserIdToMedia < ActiveRecord::Migration[5.0]
  def change
    add_reference :media, :user, index: true, foreign_key: true
  end
end
