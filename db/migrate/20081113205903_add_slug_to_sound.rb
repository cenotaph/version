class AddSlugToSound < ActiveRecord::Migration
  def self.up
    add_column :sounds, :slug, :string
  end

  def self.down
    remove_column :sounds, :slug
  end
end
