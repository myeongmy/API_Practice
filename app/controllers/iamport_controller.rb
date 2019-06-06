# https://api.iamport.kr/

#1.access_token을 받아온다 2. 고객 정보 저장 3. 결제

class IamportController < ApplicationController
    require "net/http"
    require "uri"
    require "json"
    def new
        
    end
    
    def register
        access_token = getToken
        
        card_num1 = params[:card_num1]
        card_num2 = params[:card_num2]
        card_num3 = params[:card_num3]
        card_num4 = params[:card_num4]
        
        birthday = params[:birthday]
        expiry_month = params[:expiry_month]
        expiry_year = params[:expiry_year]
        password = params[:password]
        
        customer_uid = "23269258" # 매 실행마다 바꿔줘야함. (왜냐면 등록할 때마다 고객은 고유의 값이어야 하니까)
                                         # 
        
        card_num = card_num1 + "-" + card_num2 + "-" + card_num3 + "-" + card_num4
        expiry = "20" + expiry_year + "-" + expiry_month
        
        
        
        params1 = {'customer_uid' => customer_uid, 'card_number' => card_num,
                    'expiry' => expiry, 'birth' => birthday, 'pwd_2digit' => password
        }
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json",
                        "Authorization" => access_token
        }

        uri = URI.parse("https://api.iamport.kr/subscribe/customers/#{customer_uid}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        
        response = http.post(uri.path, params1.to_json, json_headers)
        json = JSON.parse(response.body)
        
        puts json["code"]
        puts json["message"]
        
        redirect_to "/iamport/pay"
        # access_token = getToken
        
        # card_num1 = params[:card_num1]
        # card_num2 = params[:card_num2]
        # card_num3 = params[:card_num3]
        # card_num4 = params[:card_num4]
        
        # birthday = params[:birthday]
        # expiry_month = params[:expiry_month]
        # expiry_year = params[:expiry_year]
        # password = params[:password]
        
        # customer_uid = "121321321313"              #매 실행ㅇ마다 바꿔주어야 함
        
        # card_num = card_num1+"-"+card_num2+"-"+card_num3+"-"+card_num4
        
        # expiry = "20"+expiry_year+"-"+expiry_month
        
        
        # params1 = {'customer_uid' => customer_uid, 'card_number' => card_num,
        # 'expiry'=> expiry, 'birth' => birthday, 'pwd_2digit' => password}
        # # Full control
        # uri = URI.parse("https://api.iamport.kr/subscribe/customers/#{customer_uid}")
        # http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true
        
        # request = Net::HTTP::Post.new(uri.request_uri)
        # json_headers = {"Content-Type" => "application/json",
        #                 "Accept" => "application/json","Authorization" => access_token}
        # request.set_form_data({"customer_uid" => customer_uid, "card_number" => card_num,
        #     "expiry" => expiry, "birth" =>birthday,"pwd_2digit"=>password
        # })
        
        # response = http.request(request)
        # json = JSON.parse(response.body)
        # puts json["code"]       #0이나오면 제대로 저장이 된것!
        
        # #카드정보 등록하기
        # #customer_uid = "12341234"
        
        
        # redirect_to "/iamport/pay"
        
    end
    
    def pay

        
       
    end
    
    def result
        access_token = getToken
        
        customer_uid = "23269258" # register 액션과 같은 값
        
        
        amount = params[:amount].to_i
        merchant_uid = ('a'..'z').to_a.sample(15).join #매 시행마다 고유한 값(계속 바꿔주기)
        
        params1 = {'customer_uid' => customer_uid,
                'merchant_uid' => merchant_uid,
                'amount' => amount,
                'name' => 'asdfasdf'
        }
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json",
                        "Authorization" => access_token
        }

        uri = URI.parse("https://api.iamport.kr/subscribe/payments/again")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        
        
        response = http.post(uri.path, params1.to_json, json_headers)
        json = JSON.parse(response.body)
        
        puts json["code"]
        puts json["message"]   # 이상할땐 로그 확인
        
        redirect_to '/iamport/pay'
        # access_token = getToken
        # customer_uid = "121321321313"
        # amount = params[:amount].to_i
        # params1 = {"customer_uid" => customer_uid,"merchant_uid"=>"1111121",
        # 'amount' =>amount,'name'=> 'asdsafs'}
        #  json_headers = {"Content-Type" => "application/json",
        #                 "Accept" => "application/json","Authorization" => access_token}
                        
        # uri = URI.parse("https://api.iamport.kr/subscribe/payments/again")
        # http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true
        
        # response = http.request(Net::HTTP::Get.new(uri.request_uri))
        # json = JSON.parse(response.body)
        
        # puts json["code"]
        
        
    end
    
    def getToken
        uri = URI.parse("https://api.iamport.kr/users/getToken")


        # Full control
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri)
        json_headers = {"Content-Type" => "application/json",
                        "Accept" => "application/json","Authorization" => "access_token"}
        request.set_form_data({"imp_key" => "imp_apikey", "imp_secret" => "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f"}) 
        # 토큰은 30분이 지나면 만료되기때문에 재발급해주어야 함
        
        
        response = http.request(request)
        json = JSON.parse(response.body)

        return json["response"]["access_token"]
        
      
    end
end
