class Word < ActiveRecord::Base
  belongs_to :word_set
  has_many :learnts
  has_many :meanings
  has_many :first_associations, class_name: 'Association', foreign_key: 'first_word_id', inverse_of: :first_word
  has_many :second_associations, class_name: 'Association', foreign_key: 'second_word_id', inverse_of: :second_word

  attr_accessible :text, :pronounciation
end
