class FollowsController < ApplicationController
    before_action :authenticate_user!


    def show
      user = User.find(params[:account_id])
      relation_status = current_user.has_followed?(user)
      render json: { hasFollowed: relation_status }
    end
  
    def create
      current_user.follow!(params[:account_id])
      render json: { status: 'ok' }
    end
    
end