class Learnt < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_accessible :value
end
