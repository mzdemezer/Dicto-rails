class UsersController < ApplicationController
  respond_to :json

  expose(:users)
  expose(:user, attributes: :user_params)

  def index
  end

  def show
  end

  def update
    return render(nothing: true, status: 403) if current_user.id != user.id
    current_user = user

    if current_user.save
      render "users/show"
    else
      respond_with current_user
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :learnt_threshold)
  end
end
