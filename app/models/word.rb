class Word < ActiveRecord::Base
  belongs_to :word_set
  has_many :learnts
  has_many :meanings
  has_many :first_associations, class_name: 'Association', foreign_key: 'first_word_id', inverse_of: :first_word
  has_many :second_associations, class_name: 'Association', foreign_key: 'second_word_id', inverse_of: :second_word
  has_many :word_categories
  has_many :categories, through: :word_categories

  attr_accessible :text, :pronounciation

  validates :text, presence: true

  scope :search_by_scheme, -> (scheme) { where('words.text LIKE ?', "%#{scheme}%") if scheme.present? }
end
