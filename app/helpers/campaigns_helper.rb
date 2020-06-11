module CampaignsHelper
  def user_list
    User.all.find_all {|user| user if user != current_user}
  end
end
