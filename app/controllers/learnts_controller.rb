class LearntsController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:learnt) { current_user.learnts.find_or_create_by_word_id(params[:id]) }

  authorize_resource :word_set, decent_exposure: true

  def right
    learnt.right
    render "learnts/show"
  end

  def wrong
    learnt.wrong
    render "learnts/show"
  end

  def didnt_know
    learnt.didnt_know
    render "learnts/show"
  end
end
