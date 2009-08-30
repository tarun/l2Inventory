class Shelf < ActiveRecord::Base
  has_many :boxes

  def name
    self.number
  end

  def self.exists? shelf_number
    (Shelf.find_by_number(shelf_number) or false)
  end
  
end
