class AddSlugToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :slug, :string
  end

  def self.down
    remove_column :videos, :slug
  end
end
