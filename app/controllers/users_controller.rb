class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    end
    render :edit
  end

  def destroy
    @user = User.find(params[:id])
    if session[:user_id] = @user.id
      session.delete :user
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :store)
  end

end
