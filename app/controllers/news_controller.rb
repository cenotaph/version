class NewsController < ApplicationController
  # GET /news
  # GET /news.xml
  def index
    preload
    @news = News.find(:all, :order => 'created_at DESC')
    @posts = @posts[0..2]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
 #   @news = News.find(params[:id])
 
  # just show all news items for now
    index
  end
  
  def extra

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
    end
  end

 
end
