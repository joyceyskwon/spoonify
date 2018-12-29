class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user # can call current_user from my view
  def current_user
    # User.find would throw an error if cannot find the user, whereas find_by will return nil
    User.find_by({ id: session[:user_id] })
  end

  def logged_in?
    # nil is falsey in ruby
    # a user instance is truthy
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

end # end of ApplicationController
