class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.references :author
      t.references :user
      t.references :category
      t.string :location
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
