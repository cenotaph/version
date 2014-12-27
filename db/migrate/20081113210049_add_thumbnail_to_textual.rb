class AddThumbnailToTextual < ActiveRecord::Migration
  def self.up
    add_column :textuals, :thumbnail, :string
  end

  def self.down
    remove_column :textuals, :thumbnail
  end
end
