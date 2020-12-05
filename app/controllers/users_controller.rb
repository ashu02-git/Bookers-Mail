class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @users = User.all
    @user = current_user
    @newbook = @user.books.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following_user
    render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
