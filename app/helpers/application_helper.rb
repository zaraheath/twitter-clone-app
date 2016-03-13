module ApplicationHelper

  def follow_or_unfollow_link(user)
    if current_user != user
      current_user.followed_users.include?(user) ? unfollow_link(user) : follow_link(user)
    end
  end

  def follow_link(user)
    link_to "Follow", follow_user_path(user), class: "btn btn-info", method: :post
  end

  def unfollow_link(user)
    link_to "Unfollow", unfollow_user_path(user), data: {confirm: "Are you sure?"}, class: "btn btn-warning", method: :post
  end
end
