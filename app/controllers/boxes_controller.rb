class BoxesController < ApplicationController
  # GET /boxes
  # GET /boxes.xml
  def index
    @boxes = Box.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boxes }
    end
  end

  # GET /boxes/1
  # GET /boxes/1.xml
  def show
    @box = Box.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @box }
    end
  end

  # GET /boxes/new
  # GET /boxes/new.xml
  def new
    @box = Box.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @box }
    end
  end

  # GET /boxes/1/edit
  def edit
    @box = Box.find(params[:id])
  end

  # POST /boxes
  # POST /boxes.xml
  def create
    @box = Box.new(params[:box])

    respond_to do |format|
      if @box.save
        flash[:notice] = 'Box was successfully created.'
        format.html { redirect_to(@box) }
        format.xml  { render :xml => @box, :status => :created, :location => @box }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.xml
  def update
    @box = Box.find(params[:id])

    respond_to do |format|
      if @box.update_attributes(params[:box])
        flash[:notice] = 'Box was successfully updated.'
        format.html { redirect_to(@box) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.xml
  def destroy
    @box = Box.find(params[:id])
    @box.destroy

    respond_to do |format|
      format.html { redirect_to(boxes_url) }
      format.xml  { head :ok }
    end
  end
end
