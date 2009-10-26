class UserOwnerAffiliation < ActiveRecord::Base
	belongs_to :user
	belongs_to :owner
	
	has_many :transfers, :foreign_key => "handler_id"
end
