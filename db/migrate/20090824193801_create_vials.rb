class CreateVials < ActiveRecord::Migration
  def self.up
    create_table :vials do |t|
      t.integer :slot_id
      t.integer :owner_id
      t.string :name      
      t.integer :p_value
      t.datetime :frozen
      t.text :comment
      t.boolean :present
      t.timestamps
    end
  end

  def self.down
    drop_table :vials
  end
end
