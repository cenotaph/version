class Admin::TextualsController < ApplicationController
    before_filter :authenticate_user!
     # use_tinymce
    #autocomplete :author, :name 
    def index
      @textuals = Textual.find(:all)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @textuals }
      end
    end

    # GET /textuals/1
    # GET /textuals/1.xml
    def show
      @textual = Textual.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @textual }
      end
    end

    # GET /textuals/new
    # GET /textuals/new.xml
    def new
      @textual = Textual.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @textual }
      end
    end

    # GET /textuals/1/edit
    def edit
      @textual = Textual.find(params[:id])
    end

    # POST /textuals
    # POST /textuals.xml
    def create
      tags = params[:textual]['tags']
      params[:textual].delete("tags")
      @textual = Textual.new(params[:textual])

      respond_to do |format|
        if @textual.save
          unless tags.nil?
            @textual.tag_with tags
          end
          flash[:notice] = 'Textual was successfully created.'
          format.html { redirect_to([:admin, @textual]) }
          format.xml  { render :xml => @textual, :status => :created, :location => @textual }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @textual.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /textuals/1
    # PUT /textuals/1.xml
    def update
      @textual = Textual.find(params[:id])
      unless params[:textual][:tags].nil?
        @textual.tag_with params[:textual]['tags']
        params[:textual].delete("tags")
      end
      
      respond_to do |format|
        if @textual.update_attributes(params[:textual])
          flash[:notice] = 'Textual was successfully updated.'
          format.html { redirect_to([:admin, @textual]) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @textual.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /textuals/1
    # DELETE /textuals/1.xml
    def destroy
      @textual = Textual.find(params[:id])
      @textual.destroy

      respond_to do |format|
        format.html { redirect_to(textuals_url) }
        format.xml  { head :ok }
      end
    end
    
end
