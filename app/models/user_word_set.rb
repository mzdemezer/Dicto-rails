class UserWordSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :word_set

  attr_accessible :user_id, :permissions
end
