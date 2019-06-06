# https://www.juso.go.kr/CommonPageLink.do?link=/addrlink/devAddrLinkRequestSample
# http://www.juso.go.kr/addrlink/addrLinkApi.do

class AddressController < ApplicationController
    require "net/http"
    require "uri"
    require "json"

    def search
    end
    
    def results
        uri = URI.parse("http://www.juso.go.kr/addrlink/addrLinkApi.do")    #도로명 주소 -검색 api url

        # Full control
        http = Net::HTTP.new(uri.host, uri.port)
        
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data({"confmKey" => "U01TX0FVVEgyMDE4MDgwMjE1MDAzOTEwODA0NzA=", 
        "keyword" => params[:search],"resultType" => "json"})
        
        response = http.request(request)
        
        json= JSON.parse(response.body)
        @arr = json["results"]["juso"]
        
                
    end
end
