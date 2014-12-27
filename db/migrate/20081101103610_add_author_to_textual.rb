class AddAuthorToTextual < ActiveRecord::Migration
  def self.up
    add_column :textuals, :author_id, :integer
  end

  def self.down
    remove_column :textuals, :author_id
  end
end
