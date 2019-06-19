class LoginController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      flash[:messages] = "Logging in #{@user.username}."
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:messages] = "Incorrect username or password!"
      redirect_to new_login_path
    end
  end

  def destroy
    logout
    redirect_to '/login'
  end

end
