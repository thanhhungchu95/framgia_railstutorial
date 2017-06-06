class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    render file: "public/404.html", layout: false unless @user
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
