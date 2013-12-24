class WordSet < ActiveRecord::Base
  has_many :user_word_sets
  has_many :users, through: :user_word_sets

  attr_accessible :name
end
