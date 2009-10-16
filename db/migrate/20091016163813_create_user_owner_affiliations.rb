class CreateUserOwnerAffiliations < ActiveRecord::Migration
  def self.up
    create_table :user_owner_affiliations do |t|
      t.references :user
      t.references :owner
      t.string :nature # nature of relationship, to avoid conflict with any keywords
      t.timestamps
    end
  end

  def self.down
    drop_table :user_owner_affiliations
  end
end
