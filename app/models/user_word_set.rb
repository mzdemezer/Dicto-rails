class UserWordSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :word_set

  attr_accessible :user_id, :word_set_id, :permissions
end
