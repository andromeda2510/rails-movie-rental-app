class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
