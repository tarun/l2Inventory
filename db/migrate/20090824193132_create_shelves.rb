class CreateShelves < ActiveRecord::Migration
  def self.up
    create_table :shelves do |t|
      t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :shelves
  end
end
