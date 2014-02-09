class UserWordSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :word_set

  attr_accessible :user_id, :word_set_id, :permissions

  def self.select_base
    select('user_id, word_set_id, permissions')
  end

  def self.include_user_base
    joins(:user)
    .select('users.first_name, users.last_name')
  end
end
