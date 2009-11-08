class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.integer :number
      
      t.references :box
          
      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
