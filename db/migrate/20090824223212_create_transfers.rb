class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.references :handler # The lab guy
      t.references :patron  # The source/destination of the vial
      
      t.references :vial  # The Vial
      t.references :slot  # The Slot it is being placed in, being taken out of.
      
      t.datetime :when # the date/time when the transfer took places        
      t.string :type  # type of transfer , in out refreezing, etc
      t.text :comment # any additional information

      t.timestamps
    end
  end

  def self.down
    drop_table :transfers
  end
end
