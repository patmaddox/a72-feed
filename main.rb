require 'json'
require 'open-uri'
require_relative 'a72_feed'

matching_values = ['district', 'District 10']

ps_cso_url = ENV.fetch('PS_CSO_URL')
data = URI.open(ps_cso_url).read
json = JSON.parse(data)
district_index = json['values'][0].index('district')
meetings = json['values'].
  select {|v| matching_values.include?(v[district_index]) }.
  map {|m| A72Feed.google_meeting_to_tsml(m) }
puts JSON.dump(meetings)
