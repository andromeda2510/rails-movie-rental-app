class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
