class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User saved successfully #{@user.username}"
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "#{@user.username}'s details updated successfully"
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def index
    @user=User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :user)
  end
end
