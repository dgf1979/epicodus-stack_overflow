class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to log_in_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end
end
