class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You have logged in, #{@user.name}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Something went wrong, please try again"
      redirect_to log_in_path
    end

  end

  def destroy
    flash[:alert] = "You have logged out"
    session[:user_id] = nil
    redirect_to users_path
  end
end
