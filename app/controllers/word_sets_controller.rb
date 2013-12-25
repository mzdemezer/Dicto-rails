class WordSetsController < ApplicationController
  expose(:word_sets)
  expose(:word_set, attributes: :word_set_params)

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
      flash[:notice] = t('word_set.created')
      redirect_to word_set
    else
      flash[:alert] = t('errors.form')
      render :new
    end
  end

  private

  def word_set_params
    params.require(:word_set).permit(:name)
  end
end
