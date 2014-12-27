class PostsController < ApplicationController
  
 
  
  def about
    preload
    @posts = @posts[0..2]
  end
  
  def author
    preload
    @posts.delete_if{|x| x.author_id != params[:id].to_i }
      render :template => 'posts/index'
  end
  
  def cat 
    # 
    # filter by category type
    #
    preload
    @id = params[:id]
    cat = Category.find(@id)
    @posts =  Kaminari.paginate_array(cat.posts.sort_by{|x| x.created_at }.reverse).page(params[:page]).per(9)
    render :template => 'posts/index'
  end

  def categories
    @categories = Category.find(:all, :order => 'name')
    @tags = Tag.find(:all).sort{|x,y| y.taggings.count <=> x.taggings.count }
  end
  
  def context
    preload
    @posts = @posts[0..2]
  end
  
  def contributors
    preload
    @posts = @posts[0..2]
   # @contributors = Author.paginate :per_page => 6, :page => params[:page], :order => 'created_at DESC'
   @contributors = Author.find(:all, :order => 'created_at DESC')
  end
  
  def send_item_email
      e = "@item = "+ params[:email][:class].to_s 
      e = e+".find("+ params[:email][:id].to_s
      e = e+")"
      logger.warn('e is' + e)
      eval(e)
    #  instance_eval { item }
      clazz = @item.class.to_s
      Postoffice.deliver_item(@item, params[:email][:email], clazz)
  end
  
  def index
    @posts = Post.order(published_at: :desc).page(params[:page]).per(9)
  end
  
  def landing
    preload
    @posts = @posts[0..5]
    @news = News.order('created_at DESC').limit(4)
  end
  
  def show
    @post = Post.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
  def tag
    @categories = Category.find(:all, :order => 'name')
    @tags = Tag.find(:all).sort{|x,y| y.taggings.count <=> x.taggings.count }
    @posts =  Kaminari.paginate_array(Tag.find_by_name(params[:id]).taggings.map{|x| x.taggable}).page(params[:page]).per(6)

    render :template => 'posts/index'
  end
end