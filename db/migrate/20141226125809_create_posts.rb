class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :item, polymorphic: true, index: true
      t.datetime :published_at
      t.string :slug
      t.timestamps null: false
    end
    Textual.find_each(&:save)
    Sound.find_each(&:save)
    Video.find_each(&:save)
    Image.find_each(&:save)
  end
end
