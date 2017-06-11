class MicropostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params

    if @micropost.save
      flash[:success] = t ".create"
      redirect_to root_url
    else
      flash[:danger] = t ".not_create"
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t ".delete"
    else
      flash[:danger] = t ".not_delete"
    end
    redirect_back fallback_location: root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit :content
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    valid_info @micropost
  end
end
