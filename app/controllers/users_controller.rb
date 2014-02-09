class UsersController < ApplicationController
  respond_to :json

  expose(:users)

  def index
  end

end
