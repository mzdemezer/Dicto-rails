class WordSetsController < ApplicationController
  respond_to :json

  expose(:word_sets) { current_user.word_sets }
  expose(:word_set, attributes: :word_set_params)
  expose(:show_word_set) { WordSet.base_fields.with_statistics(current_user.id).find(params[:id]) }

  authorize_resource decent_exposure: true

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    uws = word_set.user_word_sets.build(user_id: current_user.id, permissions: 'w')
    if word_set.save
      uws.save
      render 'word_sets/show'
    else
      respond_with word_set
    end
  end

  def update
    if word_set.save
      render 'word_sets/show'
    else
      respond_with word_set
    end
  end

  def destroy
    word_set.destroy
    render json: {}
  end

  private

  def word_set_params
    params.require(:word_set).permit(:name)
  end
end
