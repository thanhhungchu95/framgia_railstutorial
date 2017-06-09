class SessionsController < ApplicationController
  def new
    return unless logged_in?
    flash[:danger] = t ".logout_first"
    redirect_to root_url
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      if user.activated?
        flash[:success] = t ".welcome"
        log_in user
        "1" == params[:session][:remember_me] ? remember(user) : forget(user)
        redirect_to user
      else
        flash[:warning] = t ".not_activate"
        redirect_to root_url
      end
    else
      flash.now[:danger] = t ".invalid_combine"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
