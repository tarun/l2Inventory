class Box < ActiveRecord::Base
  belongs_to :shelf
  belongs_to :owner

  has_many :slots

  def name
    "Shelf : #{self.shelf.number}, Box \# #{self.number}"
  end

end
