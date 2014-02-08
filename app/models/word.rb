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

  scope :search_by_scheme, -> (scheme) { where('words.text LIKE ?', "%#{scheme}%") }
  def self.search_by_category_ids category_ids
    joins(:word_categories)
    .where('word_categories.category_id IN (?)', category_ids)
  end

  def self.search scheme = "", category_ids = []
    words = self
    words = words.search_by_scheme(scheme) if scheme.present?
    words = words.search_by_category_ids(category_ids) if category_ids.any?
    words.includes(:categories).includes(:meanings)
  end
end
