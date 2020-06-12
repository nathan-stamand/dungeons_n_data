module CampaignsHelper
  def user_list
    User.all.find_all {|user| user if user != current_user}
  end

  def player_select 
    user_list.collect{|user| [user.username, user.id]}
  end

  def select_box_number(campaign)
    @campaign.players.length + 3 || 3
  end
end
