class CreateVials < ActiveRecord::Migration
  def self.up
    create_table :vials do |t|
      t.string :name      
      t.text :comment

      t.integer :p_value
      t.datetime :frozen_on
      
      t.references :slot
      t.boolean :present
      
      t.references :owner
      
      t.timestamps
    end
  end

  def self.down
    drop_table :vials
  end
end
