require "net/http"
require "uri"
require "json"
uri = URI.parse("https://api.iamport.kr/users/getToken")


# Full control
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({"imp_key" => "imp_apikey", "imp_secret" => "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f"})

response = http.request(request)
json = JSON.parse(response.body)

puts json["response"]["access_token"]