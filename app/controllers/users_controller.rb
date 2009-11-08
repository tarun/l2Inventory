class UsersController < ApplicationController
  
  before_filter :set_owner
  
  def index    
    @users = @owner.users
  end
  
  def new
    @user = @owner.users.new
  end

  def create
    @user = @owner.users.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      #redirect_to link_owner_user_path(params[:owner_id], @user)
      redirect_to owner_users_path
       # redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to owner_users_path
      # redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  # DELETE /users/1
   # DELETE /users/1.xml
   def destroy
     @user = User.find(params[:id])
     @user.destroy

     respond_to do |format|
       format.html { redirect_to(owner_users_url(@owner)) }
       format.xml  { head :ok }
     end
   end
   
  def link
    account = Owner.find(params[:owner_id])
    user = User.find(params[:id])
    account.users << user
    redirect_to root_url
  end
  
  def unlink
    account = Owner.find(params[:owner_id])
    user = User.find(params[:id])
    account.users.remove user
    redirect_to root_url
  end
  
  private 
  def set_owner
    @owner =  (params[:owner_id] == 'current') ? current_owner : Owner.find(params[:owner_id])
  end
  
end
