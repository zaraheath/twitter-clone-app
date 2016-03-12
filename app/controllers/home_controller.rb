class HomeController < ApplicationController

  def index
    @recent_messages = Message.eager_load(:user).order_by_recent_date.page(params[:page])
    if !user_signed_in?
      render :homepage
    else
      @messages = current_user.followed_user_messages.includes(:user).order_by_recent_date.page(params[:page])
    end
  end
end
