class MyFollowersController < ApplicationController
    def show
        @user = current_user
        @followers = @user.followers
    end
end