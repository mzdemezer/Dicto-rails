class Category < ActiveRecord::Base
  belongs_to :word_set
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_id', inverse_of: :subcategories
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', inverse_of: :parent_category

  attr_accessible :name
end
