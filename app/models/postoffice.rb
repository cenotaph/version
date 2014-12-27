class Postoffice < ActionMailer::Base
  def item(item, email, clazz)
    @recipients   = email
    @from         = "version"
    headers         "Reply-to" => "version@version.org"
    @subject      = item.title
    @sent_on      = Time.now
    @content_type = "text/html"
 
 
  #  if url_for_file_column(item, "thumbnail", "thumb").blank?
        description = '<img src="http://www.version.org/images/missing_thumb.png">'
  #    else
   #     description = ss#image_tag url_for_file_column(item, "thumbnail", "thumb")# article.slug
   #   end
      unless item.slug.nil?
        description = description + item.slug
      end
    body[:description] = description
    body[:url] = 'http://www.version.org/'+item.class.to_s.downcase+'s/'+item.id.to_s
    body[:category] = item.category.name
    body[:article] = item
    body[:clazz] = clazz
  end
 
  

end
