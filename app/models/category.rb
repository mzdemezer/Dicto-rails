class Category < ActiveRecord::Base
  belongs_to :word_set
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_id', inverse_of: :subcategories
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', inverse_of: :parent_category
  has_many :word_categories
  has_many :words, through: :word_categories

  attr_accessible :name, :word_set_id, :parent_id

  validates :name, presence: true
end
