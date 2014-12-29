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
  
  
  def page_num(options = {})
    column = options[:by] || :published_at
    order  = options[:order] || :desc
    per    = options[:per] || self.class.default_per_page
    operator = (order == :asc ? "<=" : ">=")
    
    (self.class.where("#{column} #{operator} ?", read_attribute(column)).order("#{column} #{order}").count.to_f / per).ceil
  end
  
  def permalink
    "/#{item.category.slug}/#{slug}"
  end
end
