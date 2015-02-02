class PlayersController < ApplicationController
  def index

  end
  def pies
    @data = [9020, 25257, 16428, 5502, 1824, 83, 37]
    @labels = ["Bronze", "Silver", "Gold", "Platinum", "Diamond", "Master", "Challenger"]
    @count = @data.count
  end
  def endpoint
    render json: {pie_data: [9020, 25257, 16428, 5502, 1824+83+37], pie_labels: ["Bronze", "Silver", "Gold", "Platinum", "Diamond", "Master", "Challenger"], bar_data: [1157, 15207, 23757, 19207, 12449, 7843, 4791, 3221, 2180, 11062, 286], bar_labels: ["zero", "under_one", "one_plus", "two_plus", "three_plus", "four_plus", "five_plus", "six_plus", "seven_plus", "pro", "afk"]}
  end
end


# division = {}

# Player.all.each do |player|
#   if division.has_key? player.highestAchievedSeasonTier
#     division[player.highestAchievedSeasonTier] += 1
#   else
#     division[player.highestAchievedSeasonTier] = 1
#   end
# end

# pp division