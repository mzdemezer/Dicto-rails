class Meaning < ActiveRecord::Base
  belongs_to :word

  validates :text, presence: true

  attr_accessible :text, :word_id
end
