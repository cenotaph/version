class ActsAsTaggableOnMigration < ActiveRecord::Migration
  def self.up
    # create_table :tags do |t|
    #   t.string :name
    # end

    add_column :taggings, :tagger_id, :integer
    add_column :taggings, :tagger_type, :string
    add_column :taggings, :context, :string, :limit => 128

    # add_index :taggings, [:taggable_id, :taggable_type, :context]
    execute('update taggings set context="tags"')
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
