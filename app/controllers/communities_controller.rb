class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @communities = Community.all.order('created_at DESC')
    @community = Community.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @communities = @user.communities
  end

  def create
    @community = Community.new(communities_params)
    @community.user_id = current_user.id
    if @community.save
      @communities = Community.all.order('created_at DESC')
    else
      render :index
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
  end

  private

  def communities_params
    params.require(:community).permit(:body)
  end
end
