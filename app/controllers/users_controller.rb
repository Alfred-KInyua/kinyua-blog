# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_users_with_id, only: %i[edit update show]
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
  end

  def update

    if @user.update(user_params)
      flash[:notice] = "#{@user.username}'s details updated successfully"
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

  def index
    @user = User.paginate(page: params[:page], per_page: 5)
  end

  private
  def set_users_with_id
    @user = User.find(params[:id])

end

  def user_params
    params.require(:user).permit(:username, :email, :password, :user)
  end
end
