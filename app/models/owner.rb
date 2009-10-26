class Owner < ActiveRecord::Base
  #Owner is nothing but an Account.
  has_many :user_owner_affiliations
  has_many :users, :through => :user_owner_affiliations

  has_many :boxes
  has_many :vials
  
  has_many :transfers
  
  has_many :transfers, :through => :user_owner_affiliations#, :foreign_key => "handler_id"
  has_many :transfers, :foreign_key => "patron_id"

  authenticates_many :user_sessions
end
