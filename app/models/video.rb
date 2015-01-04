class Video < ActiveRecord::Base
  include Item

  def rss_out
    short_description.html_safe
  end
  
end
