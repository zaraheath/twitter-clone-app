class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :get_user

  def show
    @messages = @user.messages.order_by_recent_date.page(params[:page])
  end

  def follow
    current_user.follow(@user)
    redirect_to :back
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to :back
  end

  def followers
    @users = @user.followers.page(params[:page])
  end

  def following
    @users = @user.followed_users.page(params[:page])
  end

  private

  def get_user
    @user = User.find(params[:id]) || User.new
  end
end
