class UsersController < ApplicationController
  before_action :authenticate_user!, except: :top
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  #def create
    #@book = Book.new(book_params)
    #@book.user_id = current_user.id
    #@book.save
    #redirect_to book_path(params[:id])
  #end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] ="You have changed your profile successfully."
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def correct_user
    user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless current_user?(user)
  end

  def current_user?(user)
    user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
