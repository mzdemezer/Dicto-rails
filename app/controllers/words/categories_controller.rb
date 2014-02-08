class Words::CategoriesController < ApplicationController
  respond_to :json

  expose(:word)
  expose(:categories) { word.categories }

  def create
    processed_params = word_categories_params
    word.categories = processed_params[:categories]
    if word.save
      render "categories/index"
    else
      render nothing: true, status: 409
    end
  end

  private

  def word_categories_params
    wcp = params.permit(:word_id, categories: [])
    wcp[:categories] ||= []
    wcp[:categories] = wcp[:categories].map { |c| Category.find(c) }
    wcp
  end
end
