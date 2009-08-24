class Vial < ActiveRecord::Base
  belongs_to :slot
  belongs_to :owner
  
end
