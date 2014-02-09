class InvitationsController < ApplicationController
  expose(:invitations) { InvitationsBuilder.build(params[:id], current_user.id) }

  def show
  end

end
