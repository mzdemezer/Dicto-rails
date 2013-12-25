class WordSet < ActiveRecord::Base
  has_many :user_word_sets
  has_many :users, through: :user_word_sets
  has_many :words
  has_many :categories

  attr_accessible :name

  validates :name, presence: true


  def permits_read_by? user
    user_word_sets.find { |uws| uws.user == user }.present?
  end
end
