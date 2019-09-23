module ApplicationHelper
  def is_following?(current, followed)
    Follow.find_by(follower_id: current, following_id: followed)
  end

end
