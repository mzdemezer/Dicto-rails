class Association < ActiveRecord::Base
  belongs_to :association_type
  belongs_to :first_word, class_name: 'Word', inverse_of: :first_associations
  belongs_to :second_word, class_name: 'Word', inverse_of: :second_associations
end
