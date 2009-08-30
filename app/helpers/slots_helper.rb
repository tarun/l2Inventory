module SlotsHelper

  def shelf_number slot
     if (slot and slot.box)
       slot.number
     else
       ""
     end
  end

  def shelf_name slot
    shelf_number slot
  end

  def box_number slot
   if (slot and slot.box)
     slot.box.number
   else
     ""
   end
  end
  
  def box_name slot
   if (slot and slot.box)
     slot.box.name
   else
     ""
   end
  end

end
