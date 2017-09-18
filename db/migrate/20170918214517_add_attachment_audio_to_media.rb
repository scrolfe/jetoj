class AddAttachmentAudioToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :media, :audio
  end
end
