class InvitationsController < ApplicationController
  expose(:invitations) { InvitationsBuilder.build(params[:id], current_user.id) }

  def show
  end

  def create
    word_set_ids = parse_word_set_ids(params[:word_set_ids])
    UserWordSetsBuilder.create_by_word_set_ids(word_set_ids, invitations)
    render "invitations/show"
  end

  private

  def parse_word_set_ids word_set_ids = []
    word_set_ids.map(&:to_i)
  end
end
