class WordsController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:words) { word_set.words.search_by_scheme params[:scheme] }
  expose(:word, attributes: :word_params)

  authorize_resource :word_set, decent_exposure: true

  def index
  end

  def show
  end

  private

  def word_params
    params.require(:word).permit(:text)
  end
end
