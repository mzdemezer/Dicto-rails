object word

attributes :id, :word_set_id, :text, :pronounciation
node :meanings do
  partial "meanings/show", object: word.meanings
end
node :categories do
  partial "categories/show", object: word.categories
end
