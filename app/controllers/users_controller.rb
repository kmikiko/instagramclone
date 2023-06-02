class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]

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
    if @user != current_user
      redirect_to user_path
    end
  end

  def update
    if @user.update(users_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    
  end

  private

  def users_params
    params.require(:user).permit(:image, :image_cache, :email, :password, :password_confirmation, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

