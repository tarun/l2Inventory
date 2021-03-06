ActionController::Routing::Routes.draw do |map|

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"  

  map.resources :user_sessions

# Let us first do an owner has multiple users, a user having multiple accounts can be done later.  
#  map.resources :users do |user| 
#	user.resources :owners, :member => { :unlink => :put, :link => :put }
#  end
  
# a owner can have multiple users, but a user can have only one account. any more stuff is assigned by groups or proxy authorization in the authorization layer
  map.resources :owners, :has_many => :users
   # do |owner|
   #  owner.resources :users, :member => { :unlink => :put, :link => :put } 
   #  end
  
# map.register "register", new_owner_user_path
  
  
  map.resources :transfers
  map.resources :slots
  map.resources :boxes
  map.resources :shelves
  map.resources :vials
  

  # Info and other almost static pages
  map.root :controller => 'main', :action => 'index'
  
  map.home '', :controller => 'main', :action => 'index'
  map.about 'about', :controller => 'main', :action => 'about'
  map.contact 'contact', :controller => 'main', :action => 'contact'
  map.help 'help', :controller => 'main', :action => 'help'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
