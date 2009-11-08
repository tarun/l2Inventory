class CreateBoxes < ActiveRecord::Migration
  def self.up
    create_table :boxes do |t|
      t.integer :number
      
      t.references :shelf
      t.references :owner # to assign default ownership to a vial.
      
      t.timestamps
    end
  end

  def self.down
    drop_table :boxes
  end
end
