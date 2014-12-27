class Post < ActiveRecord::Base
  belongs_to :item, polymorphic: true
  validates_presence_of :published_at
  extend FriendlyId
  friendly_id :slug_candidates, use: [:finders, :slugged]
  
  def slug_candidates
    [
        item.title,
        [item.title, item.author_name]
    ]
  end

  def category  
    item.category
  end
  
end
