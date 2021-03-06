# index.rss.builder
xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title 'Version
    ' #active_request_path # @controller.controller_name == 'groupings' ? 'Icewhistle reblog'+@controller.inspect :  ' sd '
    xml.description "Version Journal"
    xml.link 'http://www.version.org/feed/'

    for article in @posts.map(&:item)
      if article.thumbnail.url(:thumb).blank?
        description = image_tag '/assets/missing_thumb.png'
      else
        description = image_tag article.thumbnail.url(:thumb) 
        description +=  article.rss_out
      end
      unless article.slug.nil?
        description = description + article.slug
      end
      xml.item do
        xml.title article.title
        xml.description  description.html_safe, :type => "html"
        xml.pubDate article.created_at.to_s(:rfc822)
        if article.class == Sound
          e = {:url => 'http://version.org' + article.soundfile.url, :length => article.soundfile_file_size, :type => article.soundfile_content_type }
          xml.enclosure e
        end
        xml.link 'http://www.version.org/' + article.class.to_s.downcase + "s/" + article.friendly_id
        xml.guid 'http://www.version.org/' + article.class.to_s.downcase + "s/" + article.friendly_id
      end
    end
  end
end

