class CreateVials < ActiveRecord::Migration
  def self.up
    create_table :vials do |t|
      t.references :slot
      t.references :owner
      t.string :name      
      t.integer :p_value
      t.datetime :frozen_on
      t.text :comment
      t.boolean :present
      t.timestamps
    end
  end

  def self.down
    drop_table :vials
  end
end
