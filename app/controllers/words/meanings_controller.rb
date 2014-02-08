class Words::MeaningsController < ApplicationController
  respond_to :json

  expose(:word)
  expose(:word_set) { word.word_set }
  expose(:meaning, attributes: :meaning_params)

  def update
    save_meaning
  end

  def create
    save_meaning
  end

  def destroy
    meaning.destroy
    render json: {}
  end

  private

  def save_meaning
    if meaning.save
      render 'meanings/show'
    else
      respond_with meaning
    end
  end

  def meaning_params
    params.permit(:text, :word_id)
  end
end
