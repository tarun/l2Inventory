class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.owner :source
      t.owner :destination
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