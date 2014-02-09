class LearntsController < ApplicationController
  respond_to :json

  expose(:word_set)
  expose(:learnt) { @learnt }

  authorize_resource :word_set, decent_exposure: true

  def right
    @learnt = Learnt.right(user_id: current_user.id, word_id: params[:id])
    render_learnt
  end

  def wrong
    @learnt = Learnt.wrong(user_id: current_user.id, word_id: params[:id])
    render_learnt
  end

  def didnt_know
    @learnt = Learnt.didnt_know(user_id: current_user.id, word_id: params[:id])
    render_learnt
  end

  private

  def render_learnt
    render "learnts/show"
  end
end
