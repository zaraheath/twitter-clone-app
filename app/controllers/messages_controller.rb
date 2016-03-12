class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_message

  respond_to :html

  def create
    if @message.update(message_params)
      redirect_to user_path(current_user)
    else
      respond_with @message
    end
  end

  private

  def get_message
    @message = current_user.messages.build
  end

  def message_params
    params.require(:message).permit(:text)
  end

end
