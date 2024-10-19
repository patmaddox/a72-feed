require 'json'
require 'open-uri'
require_relative 'a72_feed'

district_index = 12
district_name = 'District 10'

ps_cso_url = ENV.fetch('PS_CSO_URL')
data = URI.open(ps_cso_url).read
json = JSON.parse(data)
meetings = json['values'].
  select {|v| v[district_index] == district_name }.
  map {|m| A72Feed.google_meeting_to_tsml(m) }
puts JSON.dump(meetings)
