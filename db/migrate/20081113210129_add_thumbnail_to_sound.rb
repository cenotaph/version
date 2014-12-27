class AddThumbnailToSound < ActiveRecord::Migration
  def self.up
    add_column :sounds, :thumbnail, :string
  end

  def self.down
    remove_column :sounds, :thumbnail
  end
end
