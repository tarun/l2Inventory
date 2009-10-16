class User < ActiveRecord::Base
  has_many :user_account_affiliations
  has_many :owners, :through => :user_owner_affiliations
  
  #attr_accessible :username, :email, :password, :password_confirmation
  acts_as_authentic  
end
