class Slot < ActiveRecord::Base
  belongs_to :box

  has_one :vial
  has_many :transfers
end
