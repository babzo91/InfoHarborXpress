module ScrapHelper
  require 'net/http'
  require 'nokogiri'

  def scrap(input_url)
    url = URI.parse(input_url)
    req = Net::HTTP::Get.new(url)
    req['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
    req['Referer'] = 'https://www.google.com/'
    req['Cookie'] = 'cookie1=value1; cookie2=value2'
    # req['Proxy-Authorization'] = 'Basic ' + Base64.encode64('username:password').chomp
    req['X-Forwarded-For'] = '127.0.0.1'

    res = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http|
      http.request(req)
    }
    Nokogiri::HTML(res.body)
  end
end
