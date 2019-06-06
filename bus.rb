require 'rubygems'
require 'rest-client'
require 'cgi'
require 'nokogiri'
require 'open-uri'
require "iconv"
require 'uri'
# class String
#   def numeric?
#     return true if self =~ /\A\d+\Z/
#     true if Float(self) rescue false  
#   end
# end  

# print "버스번호를 입력 : "
# num = gets.chomp
# print "버스정류장 id입력 : "
# bus_id = gets.chomp
# n=0
# for i in 0..num.length

# if num[i..i].numeric? == false
#   n = n+1
# end
# end
# h= num[(n-1)..num.length]
# url1 = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?serviceKey=ijltE9mKxrbB0HwVvtrvVB6kL3jPVePXQqS%2F1dNRz%2FjnTR3JMPjt1ZRLG3BOxUzRXhBbbF03lCDiBZsH2oJj2A%3D%3D&strSrch=#{h}"

# doc1 = Nokogiri::XML(open(url1))
# @buses = doc1.xpath('//itemList').map do |i|
#     { :busRouteId => i.xpath('busRouteId').inner_text,
#       :busRouteNm => i.xpath('busRouteNm').inner_text
#     }
# end

# id =  @buses.first[:busRouteId]
# if @buses.count == 1
#   id = @buses.first[:busRouteId]
# else
  
# @buses.each do |b|
#     if b[:busRouteNm] == num
#         id = b[:busRouteId]
#         break
#     end
# end
# end

# # response = RestClient::Request.execute :method => 'GET', :url => url1 


# url = "http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRouteAll?serviceKey=ijltE9mKxrbB0HwVvtrvVB6kL3jPVePXQqS%2F1dNRz%2FjnTR3JMPjt1ZRLG3BOxUzRXhBbbF03lCDiBZsH2oJj2A%3D%3D&busRouteId=#{id}"
# # headers = { :params => { CGI::escape('busRouteId') => '100100118' } }

# doc = Nokogiri::XML(open(url))
# @items = doc.xpath('//itemList').map do |i|
#     { :stNm => i.xpath('stNm').inner_text,
#       :arsId => i.xpath('arsId').inner_text,
#       :busRouteId => i.xpath('busRouteId').inner_text,
#       :rtNm => i.xpath('rtNm').inner_text,
#       :arrmsg1 => i.xpath('arrmsg1').inner_text,
#       :arrmsg2 => i.xpath('arrmsg2').inner_text,
#       :busType1 => i.xpath('busType1').inner_text,
#       :busType2 => i.xpath('busType2').inner_text
#     }
# end
# iter = 0
# @items.each do |o|
#     if o[:arsId] == bus_id or o[:stNm]== bus_id
#       puts "정류소명:#{o[:stNm]}"+"("+o[:arsId]+")"
#       puts "버스 번호 :"+o[:rtNm]
#       puts "첫번째 도착예정시간 :"+o[:arrmsg1]
#       puts "두번째 도착예정시간 :"+o[:arrmsg2]
       
#       if o[:busType1]=='0'
#           bType1 = '일반버스'
#       elsif o[:busType1] == '1'
#           bType1 = '저상버스'
#       else
#           bType1 = '굴절버스'
#       end
       
#         if o[:busType2]=='0'
#           bType2 = '일반버스'
#       elsif o[:busType2] == '1'
#           bType2 = '저상버스'
#       else
#           bType2 = '굴절버스'
#         end
       
#       puts "첫 번째 도착 차량 유형:"+bType1
#       puts "두 번째 도착 차량 유형:"+bType2
#     end
#   end
  
#   if iter == 0
#     puts "gpgppgp"
#   end

station = "2호선" 


s=URI.encode(station)
url = "http://swopenapi.seoul.go.kr/api/subway/55474c6a7773647231313348614b5479/xml/subwayLine/0/5/#{s}"
response = RestClient::Request.execute :method => 'GET', :url => url
puts response

   
       
       






