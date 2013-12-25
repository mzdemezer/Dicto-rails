class WordSet < ActiveRecord::Base
  has_many :user_word_sets
  has_many :users, through: :user_word_sets
  has_many :words
  has_many :categories

  attr_accessible :name

  validates :name, presence: true


  def permits_read_by? user
    find_user_word_set_by_user(user).present?
  end

  def permits_write_by? user
    uws = find_user_word_set_by_user(user)
    uws.present? && uws.permissions == 'w'
  end

  private

  def find_user_word_set_by_user user
    user_word_sets.find { |uws| uws.user == user }
  end
end
