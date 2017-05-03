class AddAttachmentImageToFundis < ActiveRecord::Migration
  def self.up
    change_table :fundis do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :fundis, :image
  end
end
