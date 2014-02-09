class UserWordSetsController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:user_word_sets) { word_set.user_word_sets.select_base.include_user_base }

  def index
  end

end
