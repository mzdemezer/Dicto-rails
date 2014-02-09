collection user_word_sets

extends 'user_word_sets/_base'
node :user do |uws|
  { first_name: uws.first_name, last_name: uws.last_name }
end
