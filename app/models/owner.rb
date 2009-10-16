class Owner < ActiveRecord::Base
  has_many :user_account_affiliations
  has_many :users, :through => :user_owner_affiliations
  
  has_many :boxes
  has_many :vials
  
  has_many :transfers
  
#  has_many :transfers, :foreign_key => "handler_id"
#  has_many :transfers, :foreign_key => "owner_id"
  

end
