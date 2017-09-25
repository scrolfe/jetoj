class AddHstoreExtension < ActiveRecord::Migration[5.0]
  def self.up
    enable_extension "hstore"
  end
  def self.down
    disable_extension "hstore"
  end
end
