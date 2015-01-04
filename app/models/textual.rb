class Textual < ActiveRecord::Base
  include Item
  
  def rss_out
    self.content.html_safe
  end
end
