class Api::CommunitiesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      @communities = Community.order('created_at DESC')
    end

    def create
      @community = Community.new(community_params)
      @community.user_id = current_user.id
      if @community.save
        render json: @community, status: :created
      else
        render json: @community.errors, status: :unprocessable_entity
      end
    end

    def destroy
      Community.find(params[:id]).destroy!
    end

    private

    def community_params
      params.require(:community).permit(:body)
    end
end
