class AddSlugToTextual < ActiveRecord::Migration
  def self.up
    add_column :textuals, :slug, :string
  end

  def self.down
    remove_column :textuals, :slug
  end
end
