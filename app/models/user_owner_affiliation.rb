class UserOwnerAffiliation < ActiveRecord::Base
	belongs_to :user
	belongs_to :owner
end
