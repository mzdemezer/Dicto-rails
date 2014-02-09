class Invitations
  attr_accessor :id, :user_word_sets

  def initialize(user_id, user_word_sets)
    @id = user_id
    @user_word_sets = user_word_sets
  end
end
