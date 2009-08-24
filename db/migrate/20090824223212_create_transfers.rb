class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.integer :handler_id
      t.integer :patron_id
      t.integer :vial_id
      t.integer :slot_id
      t.datetime :when
      t.string :type
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :transfers
  end
end
