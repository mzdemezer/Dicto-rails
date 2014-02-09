class UsersController < ApplicationController
  respond_to :json

  expose(:users)
  expose(:user, attributes: :user_params)

  def index
  end

  def show
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :learnt_threshold)
  end
end
