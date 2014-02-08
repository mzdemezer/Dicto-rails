class Learnt < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_accessible :value

  # TODO: eliminate lost modifications
  def right
    update_attributes value: value + 1
  end

  def wrong
    update_attributes value: value - 1
  end

  def didnt_know
  end
end
