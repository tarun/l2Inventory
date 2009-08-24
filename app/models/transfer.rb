class Transfer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :vial
  belongs_to :slot
end
