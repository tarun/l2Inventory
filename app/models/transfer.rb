class Transfer < ActiveRecord::Base
  belongs_to :patron, :class_name => "Owner", :foreign_key => "patron_id"
  belongs_to :handler, :class_name => "Owner", :foreign_key => "handler_id" 
   
  belongs_to :vial
  belongs_to :slot
end
