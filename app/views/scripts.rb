require 'pp'

matchDuration = {"under_ten" => 0, "ten_twenty" => 0, "twenty_thirty" => 0, "thirty_forty" => 0, "forty_fifty" => 0, "fifty_sixty" => 0, "over_sixty" => 0}

Match.all.each do |match|
  if match.matchMode == "CLASSIC"
    case match.matchDuration
    when < 600
      matchDuration["under_ten"] += 1
    when < 1200
      matchDuration["ten_twenty"] += 1
    when < 1800
      matchDuration["twenty_thirty"] += 1
    when < 2400
      matchDuration["thirty_forty"] += 1
    when < 3000
      matchDuration["forty_fifty"] += 1
    when < 3600
      matchDuration["fifty_sixty"] += 1
    else
      matchDuration["over_sixty"] += 1
    end
  end
end

pp matchModes

# division = {}

# Player.all.each do |player|
#   if division.has_key? player.highestAchievedSeasonTier
#     division[player.highestAchievedSeasonTier] += 1
#   else
#     division[player.highestAchievedSeasonTier] = 1
#   end
# end

# pp division

# $zero       = 0
# $under_one  = 0
# $one_plus   = 0
# $two_plus   = 0
# $three_plus = 0
# $four_plus  = 0
# $five_plus  = 0
# $six_plus   = 0
# $seven_plus = 0
# $pro        = 0
# $afk     = 0

# Player.all.each do |player|
#   if player.kills && player.deaths && player.assists
#     if player.deaths == 0
#       if player.kills == 0 && player.assists == 0
#         $afk += 1
#       else
#         $pro += 1
#       end
#     elsif player.kills == 0 && player.assists == 0
#       $zero += 1
#     else
#       kda = (player.kills + player.assists)/player.deaths
#       case kda
#       when 0
#         $under_one += 1
#       when 1
#         $one_plus += 1
#       when 2
#         $two_plus += 1
#       when 3
#         $three_plus += 1
#       when 4
#         $four_plus += 1
#       when 5
#         $five_plus += 1
#       when 6
#         $six_plus += 1
#       when 7
#         $seven_plus += 1
#       else
#         $pro += 1
#       end
#     end
#   end
# end

# p "Zero: #{$zero}"
# p "Under_one: #{$under_one}"
# p "One_plus: #{$one_plus}"
# p "Two_plus: #{$two_plus}"
# p "Three_plus: #{$three_plus}"
# p "Four_plus: #{$four_plus}"
# p "Five_plus: #{$five_plus}"
# p "Six_plus: #{$six_plus}"
# p "Seven_plus: #{$seven_plus}"
# p "Pro: #{$pro}"
# p "Afk: #{$afk}"