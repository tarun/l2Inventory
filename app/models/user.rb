class User < ActiveRecord::Base
  # belongs_to :account, :class_name => "Owner"
  belongs_to :owner
  
  #attr_accessible :username, :email, :password, :password_confirmation
  acts_as_authentic  
end
