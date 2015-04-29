class AddAttachmentPictureToShoes < ActiveRecord::Migration
  def self.up
    change_table :shoes do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :shoes, :picture
  end
end
