module Api
  module V1
    class MessagesController < Api::V1::BaseController
      def index
        @messages = User.find(params[:user_id]).messages
        render json: @messages, each_serializer: MessageSerializer
      end
    end
  end
end