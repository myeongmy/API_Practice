require "net/http"
require "uri"
require "json"

uri = URI.parse("https://project0802-myeongjinsim.c9users.io/home/index")  #요청을 보내고 싶은서버주소

# Full
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.request(Net::HTTP::Get.new(uri.request_uri))

arr=JSON.parse(response.body)    #JSON을 루비의 해시 형태로 바꾸어주어야 여기서 인식이 된다

arr.each do |a|
    puts a["title"]
end
