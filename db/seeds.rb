require 'pp'
require 'httparty'

def get_match
  match_id = 1688394832
  url = "https://na.api.pvp.net/api/lol/na/v2.2/match/#{match_id}?api_key=4f143121-4b49-4dcd-a1b3-ef02c2dc51e7"
  response = HTTParty.get(url)

  current_match = Match.create(
    matchId:        response["matchId"],
    region:         response["region"],
    matchMode:      response["matchMode"],
    matchDuration:  response["matchDuration"],
    season:         response["season"]
    )

  response["participants"].each do |participant|
    p participant["highestAchievedSeasonTier"]
    Player.create(
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

get_match