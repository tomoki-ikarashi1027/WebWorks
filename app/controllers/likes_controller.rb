class LikesController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    Like.create(user_id: current_user.id, community_id: params[:community_id])
  end

  def destroy
    @community = Community.find(params[:community_id])
    Like.find_by(user_id: current_user.id, community_id: params[:community_id]).destroy
  end

end
