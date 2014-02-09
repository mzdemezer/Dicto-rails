class UserWordSetsBuilder
  def self.create_by_word_set_ids(word_set_ids, invitations)
    batch = []
    invitations.user_word_sets.reject! do |uws|
      batch << uws if (word_set_ids.include?(uws.word_set_id) && uws.valid?)
    end
    UserWordSet.import(batch)
  end
end
