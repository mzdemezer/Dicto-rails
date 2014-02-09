class WordSet < ActiveRecord::Base
  has_many :user_word_sets
  has_many :users, through: :user_word_sets
  has_many :words
  has_many :categories

  attr_accessible :name

  validates :name, presence: true

  scope :base_fields, select("#{table_name}.*")

  def self.with_statistics user_id
    sql = WordSet::LearntPercentage.invocation(user_id: user_id, word_set_id: "#{table_name}.id")
    select(sql)
  end


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
