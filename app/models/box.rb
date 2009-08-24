class Box < ActiveRecord::Base
  belongs_to :shelf
  belongs_to :owner

  has_many :slots
end
