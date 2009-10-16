class Transfer < ActiveRecord::Base
  belongs_to :patron, :class_name => "owner"
  belongs_to :handler, :class_name => "owner"
  belongs_to :vial
  belongs_to :slot
end
