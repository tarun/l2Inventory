module BoxesHelper

  def shelf_name box
     if (box and box.shelf)
       box.shelf.name
     else
       ""
     end
  end

  def owner_name box
     if (box and box.owner)
       box.owner.name
     else
       ""
     end
  end

end
