class Owner < ActiveRecord::Base
  has_many :boxes
  has_many :vials
end
