require 'json'
require 'open-uri'

matching_values = ['district', 'District 10']

ps_cso_url = ENV.fetch('PS_CSO_URL')
data = URI.open(ps_cso_url).read
json = JSON.parse(data)
district_index = json['values'][0].index('district')
json['values'].select! {|v| matching_values.include?(v[district_index]) }
puts JSON.dump(json)
