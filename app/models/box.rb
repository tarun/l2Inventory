class Box < ActiveRecord::Base
  belongs_to :shelf
  belongs_to :owner

  has_many :slots

  def name
    "Shelf : #{self.shelf.number}, Box \# #{self.number}"
  end

  def self.exists? shelf_number, box_number
    error = false
    
    shelf = Shelf.find_by_number(shelf_number)
    unless shelf
      error = true
    else
      box = shelf.boxes.find_by_number(box_number)
      unless box
        error = true
      end
    end

    !error
  end

end
