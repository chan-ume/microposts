class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :following, :followed]
 
  def show
    @microposts = @user.microposts
  end
  
  def following
    @following_users = @user.following_users
  end
  
  def followed
    @followed_users  = @user.followed_users
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザープロフィールを編集しました'
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :country)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
