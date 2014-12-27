class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :images
  has_many :sounds
  has_many :videos
  has_many :textuals
  
  def posts
    images + sounds + videos + textuals
  end
  
end
