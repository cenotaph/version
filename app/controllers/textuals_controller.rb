class TextualsController < ApplicationController
  before_filter :get_position, :only => [:show]

  def index
    @textuals = Textual.published
  end

  ## return ajax code into opened module.  Breaks REST.
  def open
      @item = Textual.find(params[:id])
      render :partial => 'layouts/om', :locals => {:@item => @item }
  end

  # GET /textuals/1
  # GET /textuals/1.xml
  def show
    preload
    @item = Textual.find(params[:id])
    if request.path != textual_path(@item)
      return redirect_to @item, :status => :moved_permanently
    end
    
    respond_to do |format|
      format.html { render :template => 'layouts/om' }
      format.js
      format.xml  { render :xml => @textual }
    end
  end

  protected
  
  def get_position
    unless params[:position].nil?
      @position = params[:position]
    end
  end



end
