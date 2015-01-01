class ImagesController < ApplicationController
  before_filter :get_position, :except => [:index, :new, :create]
  
  def index
    @images = Image.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end
  
  ## return ajax code into opened module.  Breaks REST.
  def open
      @item = Image.find(params[:id])
      @sslaunch = '<script>reslide();</script>';
      render :partial => 'layouts/om', :locals => {:@item => @item, :@sslaunch => @sslaunch}
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    preload
    @item = Image.find(params[:id])
    if request.path != image_path(@item)
      return redirect_to @item, :status => :moved_permanently
    end    
    respond_to do |format|
      format.html  { render :template => 'layouts/om' } # show.html.erb
      format.js
      format.xml  { render :xml => @image }
    end
  end

  protected
  
  def get_position
    unless params[:position].nil?
      @position = params[:position]
    end
  end
end
