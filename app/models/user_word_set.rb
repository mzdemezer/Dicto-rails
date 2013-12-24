class UserWordSet < ActiveRecord::Base
  belongs_to :user
  belongs_to :word_set
end
