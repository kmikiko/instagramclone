class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:image, :image_cache, :email, :password, :password_confirmation, :name)
  end
end

