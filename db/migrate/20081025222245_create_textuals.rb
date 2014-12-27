class CreateTextuals < ActiveRecord::Migration
  def self.up
    create_table :textuals do |t|
      t.string :title
      t.references :user
      t.references :category
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :textuals
  end
end
