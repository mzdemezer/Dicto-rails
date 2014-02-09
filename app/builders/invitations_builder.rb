class InvitationsBuilder
  def self.build user_id, current_user_id
    if User.exists?(user_id)
      user_word_sets = UserWordSet.select('user_word_sets.word_set_id, ws.name')
        .joins("LEFT JOIN user_word_sets uws ON user_word_sets.word_set_id = uws.word_set_id AND uws.user_id = #{user_id}")
        .joins('JOIN word_sets ws ON user_word_sets.word_set_id = ws.id')
        .where('user_word_sets.user_id = ?', current_user_id)
        .where('user_word_sets.permissions = \'w\'')
        .where('uws.word_set_id IS NULL')

      user_word_sets.each do |uws|
        uws.user_id = user_id
        uws.permissions = 'r'
      end
    else
      user_word_sets = []
    end

    Invitations.new(user_id, user_word_sets)
  end
end
