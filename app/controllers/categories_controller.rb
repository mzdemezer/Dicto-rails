class CategoriesController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:categories) { word_set.categories }
  expose(:category, attributes: :category_params)

  def index
  end

  def update
    save_category
  end

  def create
    save_category
  end

  def destroy
    category.destroy
    render json: {}
  end

  private

  def save_category
    if category.save
      render 'categories/show'
    else
      respond_with category
    end
  end

  def category_params
    params.permit(:name, :word_set_id, :parent_id)
  end
end
