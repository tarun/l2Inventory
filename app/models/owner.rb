class Owner < ActiveRecord::Base
  has_many :boxes
  has_many :vials
  has_many :transfers
end
