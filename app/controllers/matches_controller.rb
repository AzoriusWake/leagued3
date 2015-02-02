require 'pp'

class MatchesController < ApplicationController
  def index
  end
  def pies
    @data = [308, 2798, 2807, 1611, 351]
    @labels = ["< 20min", "20-30min", "30-40min", "40-50min", " > 50min"]
    @count = @data.count
  end
  def endpoint
    render json: {pie_data: [308, 2798, 2807, 1611, 351], pie_labels: ["< 20min", "20-30min", "30-40min", "40-50min", " > 50min"]}
  end
end

matchDuration = {"under_twenty" => 0, "twenty_thirty" => 0, "thirty_forty" => 0, "forty_fifty" => 0, "over_fifty" => 0}

Match.all.each do |match|
  if match.matchMode == "CLASSIC"
    # p match.matchDuration
    # p match.matchDuration < 3000
    case match.matchDuration
    when 0..1200
      matchDuration["under_twenty"] += 1
    when 1201..1800
      puts "here"
      matchDuration["twenty_thirty"] += 1
    when 1801..2400
      matchDuration["thirty_forty"] += 1
    when 2401..3000
      matchDuration["forty_fifty"] += 1
    else
      matchDuration["over_fifty"] += 1
    end
  end
end

pp matchDuration