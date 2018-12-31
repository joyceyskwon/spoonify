class SessionsController < ApplicationController
  # before_action :authorized comes from ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = nil
    flash[:notice] = 'You logged out!'
    redirect_to home_path
  end

end # end of SessionsController
