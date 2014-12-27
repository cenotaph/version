module Item
  extend ActiveSupport::Concern
  included do 
    has_one :post, as: :item
    belongs_to :user
    belongs_to :category
    belongs_to :author
    mount_uploader :thumbnail, ImageUploader
  
    before_save :sync_with_post
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
  
    acts_as_taggable
 
    scope :published, -> () { where(published: true) }
  end
  
  def author_name
    author.name if author
  end
  
  def author_name=(name)
    self.author = Author.find_or_create_by_name(name)
  end
  
  def sync_with_post
    if published && post.nil?
      self.post = Post.new(:published_at => self.created_at)
    elsif published == false
      self.post.destroy if self.post
    end
    
  end
  
end