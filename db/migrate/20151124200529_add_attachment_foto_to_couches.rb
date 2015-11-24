class AddAttachmentFotoToCouches < ActiveRecord::Migration
  def self.up
    change_table :couches do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :couches, :foto
  end
end
