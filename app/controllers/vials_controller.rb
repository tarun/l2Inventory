class VialsController < ApplicationController
  # GET /vials
  # GET /vials.xml
  def index
    @vials = Vial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vials }
    end
  end

  # GET /vials/1
  # GET /vials/1.xml
  def show
    @vial = Vial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vial }
    end
  end

  # GET /vials/new
  # GET /vials/new.xml
  def new
    @vial = Vial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vial }
    end
  end

  # GET /vials/1/edit
  def edit
    @vial = Vial.find(params[:id])
  end

  # POST /vials
  # POST /vials.xml
  def create
    @vial = Vial.new(params[:vial])

    respond_to do |format|
      if @vial.save
        flash[:notice] = 'Vial was successfully created.'
        format.html { redirect_to(@vial) }
        format.xml  { render :xml => @vial, :status => :created, :location => @vial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vials/1
  # PUT /vials/1.xml
  def update
    @vial = Vial.find(params[:id])

    respond_to do |format|
      if @vial.update_attributes(params[:vial])
        flash[:notice] = 'Vial was successfully updated.'
        format.html { redirect_to(@vial) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vials/1
  # DELETE /vials/1.xml
  def destroy
    @vial = Vial.find(params[:id])
    @vial.destroy

    respond_to do |format|
      format.html { redirect_to(vials_url) }
      format.xml  { head :ok }
    end
  end
end
