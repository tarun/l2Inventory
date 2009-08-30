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
    error = false
    msg = ""
    @box = Box.new

    shelf = Shelf.find_by_number(params[:box][:shelf])
    unless shelf
      error = true
      msg << "Shelf does not exist"
    else
      @box.shelf = shelf
      box = shelf.boxes.find_by_number(params[:box][:number])
      if box
        error = true
        msg << "Box already exists, Please Edit and Update Instead"
        redirect_to edit_box_path(box)        
        flash[:notice] = msg
        return
      else
        @box.number = params[:box][:number]
      end
    end    

    owner = Owner.find_by_name(params[:box][:owner])
    unless owner
      error = true
      msg << "Owner name unknown"
    else
      @box.owner = owner
    end            

    respond_to do |format|
      if !error and @box.save
        flash[:notice] = 'Box was successfully created.'
        format.html { redirect_to(@box) }
        format.xml  { render :xml => @box, :status => :created, :location => @box }
      else
        flash[:notice] = msg
        format.html { render :action => "new" }
        format.xml  { render :xml => @box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.xml
  def update
    @box = Box.find(params[:id])

    error = false
    msg = ""

    shelf = Shelf.find_by_number(params[:box][:shelf])
    unless shelf
      error = true
      msg << "Shelf does not exist"
    else
      @box.shelf = shelf
      box = shelf.boxes.find_by_number(params[:box][:number])
      if box
        error = true
        msg << "Box already exists, Please Edit and Update Instead"
        redirect_to edit_box_path(box)
        flash[:notice] = msg
        return
      else
        @box.number = params[:box][:number]
      end
    end

    owner = Owner.find_by_name(params[:box][:owner])
    unless owner
      error = true
      msg << "Owner name unknown"
    else
      @box.owner = owner
    end


    respond_to do |format|
      if !error and @box.update_attributes(params[:box])
        flash[:notice] = 'Box was successfully updated.'
        format.html { redirect_to(@box) }
        format.xml  { head :ok }
      else
        flash[:notice] = msg
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
