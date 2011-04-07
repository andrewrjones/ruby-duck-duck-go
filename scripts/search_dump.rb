# dumps out the result of the query, in JSON and Ruby
# used during development
#
# usage: ruby scripts/search_dump.rb foo

require 'rubygems'
require 'httpclient'
require 'json'
require 'pp'

http = HTTPClient.new
query = { 'q' => ARGV[0], 'o' => 'json' }

json = http.get_content('http://api.duckduckgo.com/', query)
ruby = JSON.parse(json)

puts 'JSON'
puts '----'
puts json
puts
puts 'Ruby'
puts '----'
pp ruby
