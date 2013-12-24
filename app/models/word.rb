class Word < ActiveRecord::Base
  attr_accessible :text, :pronounciation

  belongs_to :word_set
  has_many :learnts
  has_many :meanings
end
