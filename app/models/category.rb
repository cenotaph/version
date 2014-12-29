class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_many :images
  has_many :sounds
  has_many :videos
  has_many :textuals

  def posts
    c = images.map(&:post) + sounds.map(&:post) + videos.map(&:post) + textuals.map(&:post)
    c.flatten.compact
  end
  
end
