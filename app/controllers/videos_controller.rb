class VideosController < ApplicationController
  before_filter :get_position, :only => [:show]
  def index
    @videos = Video.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  ## return ajax code into opened module.  Breaks REST.
  def open
      @item = Video.find(params[:id])
      render :partial => 'layouts/om', :locals => {:@item => @item }
  end
  
  # GET /videos/1
  # GET /videos/1.xml
  def show
    preload
    @item = Video.find(params[:id])
    if request.path != video_path(@item)
      return redirect_to @item, :status => :moved_permanently
    end
    respond_to do |format|
      format.html { render :template => 'layouts/om' } # show.html.erb
      format.js
      format.xml  { render :xml => @video }
    end
  end
  protected
  
  def get_position
    unless params[:position].nil?
      @position = params[:position]
    end
  end



end
