class Author < ActiveRecord::Base
  has_many :images
  has_many :textuals
  has_many :videos
  has_many :sounds

  extend FriendlyId
  friendly_id :name, use: :slugged

end
