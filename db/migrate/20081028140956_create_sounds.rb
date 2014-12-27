class CreateSounds < ActiveRecord::Migration
  def self.up
    create_table :sounds do |t|
      t.string :title
      t.references :user
      t.references :category
      t.text :description
      t.string :soundfile

      t.timestamps
    end
  end

  def self.down
    drop_table :sounds
  end
end
