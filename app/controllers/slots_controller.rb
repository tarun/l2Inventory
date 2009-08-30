class SlotsController < ApplicationController
  # GET /slots
  # GET /slots.xml
  def index
    @slots = Slot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slots }
    end
  end

  # GET /slots/1
  # GET /slots/1.xml
  def show
    @slot = Slot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slot }
    end
  end

  # GET /slots/new
  # GET /slots/new.xml
  def new
    @slot = Slot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slot }
    end
  end

  # GET /slots/1/edit
  def edit
    @slot = Slot.find(params[:id])
  end

  # POST /slots
  # POST /slots.xml
  def create
    error = false
    msg = ""
    @slot = Slot.new

    shelf = Shelf.find_by_number(params[:slot][:shelf])
    unless shelf
      error = true
      msg << "Shelf does not exist"
    else
      box = shelf.boxes.find_by_number(params[:slot][:box])
      unless box
        error = true
        msg << "Box does not exist, Please create box first"
        #redirect_to new_box_path
        #flash[:notice] = msg
        #return
      else
        slot = box.slots.find_by_number(params[:slot][:number])
        if slot
          error = true
          msg << "Slot already exists, Please edit/update"
          redirect_to edit_slot_path(slot)
          flash[:notice] = msg
          return
        else
          @slot.box = box
          @slot.number = params[:slot][:number]
        end        
      end
    end

    respond_to do |format|
      if !error and @slot.save
        flash[:notice] = 'Slot was successfully created.'
        format.html { redirect_to(@slot) }
        format.xml  { render :xml => @slot, :status => :created, :location => @slot }
      else
        flash[:notice] = msg
        format.html { render :action => "new" }
        format.xml  { render :xml => @slot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slots/1
  # PUT /slots/1.xml
  def update
    @slot = Slot.find(params[:id])

    error = false
    msg = ""

    shelf = Shelf.find_by_number(params[:slot][:shelf])
    unless shelf
      error = true
      msg << "Shelf does not exist"
    else
      box = shelf.boxes.find_by_number(params[:slot][:box])
      unless box
        error = true
        msg << "Box does not exist, Please create box first"
      else
        slot = box.slots.find_by_number(params[:slot][:number])        
          msg << "New Slot created" if slot
          @slot.box = box
          @slot.number = params[:slot][:number]
      end      
    end

    respond_to do |format|
      if !error and @slot.update_attributes(params[:slot])
        flash[:notice] = 'Slot was successfully updated.'
        format.html { redirect_to(@slot) }
        format.xml  { head :ok }
      else
        flash[:notice] = msg
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.xml
  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy

    respond_to do |format|
      format.html { redirect_to(slots_url) }
      format.xml  { head :ok }
    end
  end

end
