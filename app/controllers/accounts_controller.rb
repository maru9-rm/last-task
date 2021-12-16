class AccountsController < ApplicationController
    def show
      @user = User.find(params[:id])
      if @user == current_user
        redirect_to profile_path
      end

      relationships = Relationship.all
      following_relationships = relationships.where(following_id: @user.id)
      follower_relationship = following_relationships.find_by(follower_id: current_user.id)
      @relationship_id = follower_relationship&.id

    end
  end