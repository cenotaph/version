class Image < ActiveRecord::Base
  include Item

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader    
  mount_uploader :image4, ImageUploader
  mount_uploader :image5, ImageUploader

  def rss_out
    out = ''
    (1..5).each do |n|
      out += "<img src=\"#{self.send('image' + n.to_s).url}\">"
    end
    out
  end
      
  
end
