class Transfer < ActiveRecord::Base
  belongs_to :patron, :class_name => "owner", :foreign_key => "patron_id"
  belongs_to :handler, :class_name => "UserOwnerAffiliation", :foreign_key => "handler_id"  
  belongs_to :vial
  belongs_to :slot
end
