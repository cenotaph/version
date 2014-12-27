class SoundsController < ApplicationController
  before_filter :get_position, :only => [:show]
  def index
    @sounds = Sound.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sounds }
    end
  end


  ## return ajax code into opened module.  Breaks REST.
  def open
      @item = Sound.find(params[:id])
      render :partial => 'layouts/om', :locals => {:@item => @item }
  end
  
  # GET /sounds/1
  # GET /sounds/1.xml
  def show
    preload
    @item = Sound.find(params[:id])
    if request.path != sound_path(@item)
      return redirect_to @item, :status => :moved_permanently
    end
    respond_to do |format|
      format.html  { render :template => 'layouts/om' } # show.html.erb
      format.js
      format.xml  { render :xml => @sound }
    end
  end
  protected
  
  def get_position
    unless params[:position].nil?
      @position = params[:position]
    end
  end


 
end
