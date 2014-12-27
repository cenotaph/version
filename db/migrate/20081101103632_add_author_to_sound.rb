class AddAuthorToSound < ActiveRecord::Migration
  def self.up
    add_column :sounds, :author_id, :integer
  end

  def self.down
    remove_column :sounds, :author_id
  end
end
