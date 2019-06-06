require "net/http"
require "uri"
require "json"


params = {'title' => '제목입니다', 'content' => '내용입니다'}
json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}

uri = URI.parse('https://project0802-myeongjinsim.c9users.io/home/create')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

response = http.post(uri.path, params.to_json, json_headers)

puts response.body