class CreateSlots < ActiveRecord::Migration
  def self.up
    create_table :slots do |t|
      t.integer :box_id
      t.timestamps
    end
  end

  def self.down
    drop_table :slots
  end
end
