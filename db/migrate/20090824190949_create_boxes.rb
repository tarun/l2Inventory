class CreateBoxes < ActiveRecord::Migration
  def self.up
    create_table :boxes do |t|
      t.integer :number
      t.integer :shelf_id
      t.integer :owner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :boxes
  end
end
