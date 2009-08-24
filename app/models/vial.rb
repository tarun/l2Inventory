class Vial < ActiveRecord::Base
  belongs_to :slot
  belongs_to :owner

  has_many :transfers
end
