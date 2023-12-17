class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && BCrypt::Password.new(user.password_digest) == params[:session][:password]
      # Authentication successful
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      # Authentication failed
      flash[:error] = "Invalid username or password"
      render 'new'
    end
  end
  def destroy
    # Your logout logic here
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
