class RelationshipsController < ApplicationController
  def create
    user = User.find_by id: params[:followed_id]
    current_user.follow user
    redirect_to user
  end

  def destroy
    user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow user
    redirect_to user
  end
end
