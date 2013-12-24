class AssociationType < ActiveRecord::Base
  attr_accessible :name

  has_many :associations
end
