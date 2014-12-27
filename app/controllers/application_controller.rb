class ApplicationController < ActionController::Base

  	 
  helper :all # include all helpers, all the time

  protect_from_forgery 
  
  
  before_filter :get_metadata
  
  def get_metadata
    @categories = Category.all.order(:name)
    @tags = Tag.all.sort_by{|y| y.taggings.count }
  end
  
  def preload
    #
    # at some point, this will probably become too slow and ridiculous and we'll have to 
    # incorporate pagination issues into it.  but for now, it works!
    #
     @images = Image.order('created_at DESC')
     @textuals = Textual.order('created_at DESC')
     @sounds = Sound.order('created_at DESC')
     @videos = Video.order('created_at DESC')
     @posts = @images + @textuals + @sounds + @videos
     
     @posts.sort!{|x,y| y.created_at <=> x.created_at}
     
     @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(9)

   end
   
end
