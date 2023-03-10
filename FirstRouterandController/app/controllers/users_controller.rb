class UsersController < ApplicationController
  def index
    param = params[:query]
    if param.nil?
      render json: User.all
    else
      render json: User.where('username LIKE (?)', param)
    end
  end

  def create
    user = User.new(user_params)

    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    incoming_wildcard = params[:id]
    user = User.find(incoming_wildcard)
    if user
        render json: user
    else
      render json: ['not found'], status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user && user.update(user_params)
      redirect_to user_url(user.id)
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    incoming_wildcard = params[:id]
    user = User.find(incoming_wildcard)
    user.destroy

    redirect_to users_url
  end

  private
  def user_params
    params.require(:users).permit(:username)
  end
end