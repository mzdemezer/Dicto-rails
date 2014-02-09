class Learnt < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_accessible :value, :word_id, :user_id

  def self.right(**attributes)
    arguments = attributes.slice(:user_id, :word_id).merge({ dvalue: 1 })
    update_learnt(arguments)
  end

  def self.wrong(**attributes)
    arguments = attributes.slice(:user_id, :word_id).merge({ dvalue: -1 })
    update_learnt(arguments)
  end

  def self.didnt_know(**attributes)
    arguments = attributes.slice(:user_id, :word_id)
    find_or_initialize_by_user_id_and_word_id(arguments)
  end

  private

  def self.update_learnt(arguments)
    Learnt::UpdateLearntProcedure.call(arguments)
  end
end
