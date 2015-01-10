require 'pp'
require 'httparty'

def get_match(match_id)
  url = "https://na.api.pvp.net/api/lol/na/v2.2/match/#{match_id}?api_key=4f143121-4b49-4dcd-a1b3-ef02c2dc51e7"
  response = HTTParty.get(url)
  # pp response.code
  return if response.code != 200

  current_match = Match.create(
    matchId:        response["matchId"],
    region:         response["region"],
    matchMode:      response["matchMode"],
    matchDuration:  response["matchDuration"],
    season:         response["season"]
    )
  response["participants"].each do |participant|
    current_match.players.create(
      match_id:                   current_match.id,
      highestAchievedSeasonTier:  participant["highestAchievedSeasonTier"],
      role:                       participant["timeline"]["role"],
      lane:                       participant["timeline"]["lane"],
      xpPerMinDeltas:             participant["timeline"]["xpPerMinDeltas"]["zeroToTen"],
      goldPerMinDeltas:           participant["timeline"]["goldPerMinDeltas"]["zeroToTen"],
      winner:                     participant["stats"]["winner"].to_s,
      champLevel:                 participant["stats"]["champLevel"],
      kills:                      participant["stats"]["kills"],
      deaths:                     participant["stats"]["deaths"],
      assists:                    participant["stats"]["assists"],
      minionsKilled:              participant["stats"]["minionsKilled"]
      )
  end
end

def collect_data(match_id)
  50.times do
    10.times do
      get_match(match_id)
      match_id += 1
    end
    puts "---> Batch of 10 done <---"
    puts "---> Last ID: #{match_id} <---"
    sleep(10) #10 API calls per 10s
  end
end

match_id = 1688395000 #need to update every time you seed
10.times do
  collect_data(match_id)
  puts "-------> Batch of 500 done <-------"
  puts "-------> Last ID: #{match_id} <-------"
  sleep(600) #500 API calls per 10m
end