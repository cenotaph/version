class AddPublishedToItems < ActiveRecord::Migration
  def change
    add_column :textuals, :published, :boolean, null: false, default: false
    add_column :sounds, :published, :boolean, null: false, default: false
    add_column :images, :published, :boolean, null: false, default: false
    add_column :videos, :published, :boolean, null: false, default: false
    execute('update textuals set published = true')
    execute('update sounds set published = true')
    execute('update images set published = true')
    execute('update videos set published = true')
    
  end
end
