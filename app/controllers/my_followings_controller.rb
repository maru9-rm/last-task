class MyFollowingsController < ApplicationController
    def show
        @user = current_user
        @followings = @user.followings
    end
end