class SessionsController < ApplicationController
  def new
    return unless logged_in?
    flash[:danger] = t ".logout_first"
    redirect_to root_url
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      flash[:success] = t ".welcome"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end