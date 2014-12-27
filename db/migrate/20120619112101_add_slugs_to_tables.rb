class AddSlugsToTables < ActiveRecord::Migration
  def self.up
    add_column :authors, :slug, :string
    add_index :authors, :slug, unique: true
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true    
    add_column :news, :slug, :string
    add_index :news, :slug, unique: true
    
    rename_column :images, :slug, :short_description
    add_column :images, :slug, :string
    add_index :images, :slug, unique: true    
    
    rename_column :videos, :slug, :short_description    
    add_column :videos, :slug, :string
    add_index :videos, :slug, unique: true
    
    rename_column :sounds, :slug, :short_description
    add_column :sounds, :slug, :string
    add_index :sounds, :slug, unique: true
    
    rename_column :textuals, :slug, :short_description  
    add_column :textuals, :slug, :string
    add_index :textuals, :slug, unique: true            
    Author.find_each(&:save)
    Category.find_each(&:save)
    News.find_each(&:save)
    Image.find_each(&:save)
    Sound.find_each(&:save)
    Video.find_each(&:save)
    Textual.find_each(&:save)            
end

  def self.down
    rename_column :images, :short_description, :slug
    rename_column :videos, :short_description, :slug
    rename_column :textuals, :short_description, :slug
    rename_column :sounds, :short_description, :slug            
    remove_column :news, :slug
    remove_column :authors, :slug
    remove_column :categories, :slug
  end
  
end
