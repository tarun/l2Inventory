class CreateVials < ActiveRecord::Migration
  def self.up
    create_table :vials do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :vials
  end
end
