class Admin::NewsController < ApplicationController
  before_filter :authenticate_user!
    use_tinymce
#      :options => {
#                                    :theme => 'advanced',
#                                    :theme_advanced_resizing => true,
#                                    :theme_advanced_resize_horizontal => false,
#                                    :plugins => %w{ table fullscreen }
#                                  }
# # GET /news/new
 # GET /news/new.xml
 def index
   @news = News.find(:all)

   respond_to do |format|
     format.html # index.html.erb
     format.xml  { render :xml => @news }
   end
 end

 # GET /news/1
 # GET /news/1.xml
 def show
   @news = News.find(params[:id])

   respond_to do |format|
     format.html # show.html.erb
     format.xml  { render :xml => @news }
   end
 end
 
 def new
   @news = News.new

   respond_to do |format|
     format.html # new.html.erb
     format.xml  { render :xml => @news }
   end
 end

 # GET /news/1/edit
 def edit
   @news = News.find(params[:id])
 end

 # POST /news
 # POST /news.xml
 def create
   @news = News.new(params[:news])

   respond_to do |format|
     if @news.save
       flash[:notice] = 'News was successfully created.'
       format.html { redirect_to([:admin, @news]) }
       format.xml  { render :xml => @news, :status => :created, :location => @news }
     else
       format.html { render :action => "new" }
       format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
     end
   end
 end

 # PUT /news/1
 # PUT /news/1.xml
 def update
   @news = News.find(params[:id])

   respond_to do |format|
     if @news.update_attributes(params[:news])
       flash[:notice] = 'News was successfully updated.'
       format.html { redirect_to([:admin, @news]) }
       format.xml  { head :ok }
     else
       format.html { render :action => "edit" }
       format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
     end
   end
 end

 # DELETE /news/1
 # DELETE /news/1.xml
 def destroy
   @news = News.find(params[:id])
   @news.destroy

   respond_to do |format|
     format.html { redirect_to(admin_news_url) }
     format.xml  { head :ok }
   end
 end
end