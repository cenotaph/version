class PostsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
 
  
  def about
    @posts = Post.order(published_at: :desc).page(params[:page]).per(3)
    set_meta_tags title: 'about'
  end
  
  def author
    preload
    @posts.delete_if{|x| x.author_id != params[:id].to_i }
      render :template => 'posts/index'
  end
  
  def cat 
    @id = params[:id]
    cat = Category.find(@id)
    @posts =  Kaminari.paginate_array(cat.posts.sort_by{|x| x.published_at }.reverse).page(params[:page]).per(12)
    
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
    @posts = Post.order(published_at: :desc).page(params[:page]).per(3)
    set_meta_tags title: 'contributors'
   @contributors = Author.all.order(created_at: :desc)
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
    @posts = Post.order(published_at: :desc).page(params[:page]).per(12)
    @nofilters = true
  end
  
  def landing
    preload
    @posts = @posts[0..5]
    @news = News.order('created_at DESC').limit(4)
  end
  
  def show
    
    if params[:page]
      redirect_to posts_path(:page => params[:page])
    else
      @post = Post.find(params[:id])
      posts = Post.order(published_at: :desc).page(1)
      page_number =  @post.page_num
      @posts = Post.order(published_at: :desc).page(@post.page_num)

      set_meta_tags title: 'content'
      if request.xhr?
        render :layout => false
      else
        render template: 'posts/permalink'
      end
    end
  end
  
  def tag
    @categories = Category.all.order(:name)
    @tags = Tag.all.sort_by{|x| x.taggings.count }
    @posts =  Kaminari.paginate_array(Tag.find_by(:name => params[:id]).taggings.map{|x| x.taggable.post }).page(params[:page]).per(12)

    render :template => 'posts/index'
  end
  
  private

  def set_url
    @post = Post.friendly.find(params[:id])
    redirect_to "/#{@post.category.name}/#{@post.friendly_id}",  status: 301 unless @post.friendly_id == params[:id]
  end
  
end