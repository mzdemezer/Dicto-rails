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
  def self.search_by_category_ids category_ids
    joins(:word_categories)
    .where('word_categories.category_id IN (?)', category_ids)
  end

  def self.search scheme = "", category_ids = []
    words = search_by_scheme(scheme)
    words = words.search_by_category_ids(category_ids) if category_ids.any?
    words.group(table_columns)
  end

  def self.joins_learnt user_id
    joins("LEFT JOIN learnts l ON l.word_id = words.id AND l.user_id = #{user_id}")
    .select('words.*, NULLIF(l.value, 0) learnt')
    .group('NULLIF(l.value, 0)')
  end

  def self.includes_associations user_id
    joins_learnt(user_id)
    .includes(:categories)
    .includes(:meanings)
  end

  private

  def self.table_columns
    @@table_columns ||= column_names.map { |c| "#{table_name}.#{c}" }
  end
end
