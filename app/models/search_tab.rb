class SearchTab < ActiveRecord::Base
  belongs_to :user

  attr_accessible :scheme_prefix, :scheme_suffix, :open
end
