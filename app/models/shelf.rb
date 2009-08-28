class Shelf < ActiveRecord::Base
  has_many :boxes

  def name
    self.number
  end
end
