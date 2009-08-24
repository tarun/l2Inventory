class Slot < ActiveRecord::Base
  belongs_to :box

  has_one :vial
end
