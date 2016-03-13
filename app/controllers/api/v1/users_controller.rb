module Api
  module V1
    class UsersController < Api::V1::BaseController
      def followers
        @followers = User.find(params[:id]).followers
        render json: @followers, each_serializer: UserSerializer
      end

      def following
        @following = User.find(params[:id]).followed_users
        render json: @following, each_serializer: UserSerializer
      end
    end
  end
end