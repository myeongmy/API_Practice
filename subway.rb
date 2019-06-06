require "iconv"
 
u2e = Iconv.new("EUC-KR", "UTF-8")
 
s = u2e.iconv("고맙습니다")
 
puts s.encode('utf-8') # EUC-KR 로 변환된 문자열