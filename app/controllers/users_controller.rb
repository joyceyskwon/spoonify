class UsersController < ApplicationController
  # before_action :authorized comes from ApplicationController
  skip_before_action :authorized, only: [:new, :create]

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
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
    # if @user.valid?
    # else
    #   flash[:notice] = 'Try again'
    #   render :new
    # end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.valid?
      flash[:notice] = 'You have successfully updated your account!'
      redirect_to @user
    else
      flash[:notice] = 'Invalid input. Try again.'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'You have successfully deactivated.'
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end # end of UsersController
