class WordSet < ActiveRecord::Base
  has_many :user_word_sets
  has_many :users, through: :user_word_sets
  has_many :words
  has_many :categories

  attr_accessible :name
end
