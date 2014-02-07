class CategoriesController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:categories) { word_set.categories }

  def index
  end

end
