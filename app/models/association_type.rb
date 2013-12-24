class AssociationType < ActiveRecord::Base
  has_many :associations

  attr_accessible :name
end
