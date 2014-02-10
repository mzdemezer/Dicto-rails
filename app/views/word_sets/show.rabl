object show_word_set

extends 'word_sets/_base'
node :learnt_percentage do |ws|
  ws.learnt_percentage || "0.0"
end
