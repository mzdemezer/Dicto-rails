object invitations

attributes :id
child :user_word_sets do |invitations|
  extends 'user_word_sets/_base'
  attributes :name
end
