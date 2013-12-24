class Meaning < ActiveRecord::Base
  attr_accessible :text
  belongs_to :word
end
