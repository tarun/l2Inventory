class Owner < ActiveRecord::Base
  #Owner is nothing but an Account/Entity.
  has_many :users
  authenticates_many :user_sessions
  
  has_many :boxes
  has_many :vials
  
  has_many :handled_transfers, :class_name => "Transfer", :foreign_key => "handler_id"
  has_many :patron_transfers, :class_name => "Transfer",  :foreign_key => "patron_id"
end
