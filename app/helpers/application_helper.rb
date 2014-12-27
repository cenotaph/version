# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def onclick_to_remote(options = {})
  # this awesome helper courtesy of http://railsforum.com/viewtopic.php?id=18511
    *args = remote_function(options)
    function = args[0] || ''
    function = update_page(&block) if block_given?
    "onclick=\"#{function}; return false;\""
  end 
  
  def truncate_words(text, length = 25, end_string = ' ...')
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

end
