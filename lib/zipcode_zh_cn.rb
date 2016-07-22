require "zipcode_zh_cn/version"
require "http"
require "nokogiri"

module ZipcodeZhCn
  ApiHost = "http://opendata.baidu.com/"
  ApiAction = "/post/s"
  ApiUrl = ApiHost + ApiAction
  DefaultParams = {:rn => 1, :ie => "utf-8"}.freeze
  DefaultZipCode = ""

  ## get zipcode by address string
  def self.get_zipcode(addr, http = HTTP)
    #special handle
    addr.gsub!('省直辖行政单位','')
    addr.gsub!('省直辖县级行政单位','')
    addr.gsub!('自治区直辖县级行政区划','')
    addr.gsub!('省直辖县级行政区划','')
    addr.gsub!("广东省广州市越秀区", "广州市越秀区")
    addr.gsub!("广西壮族自治区南宁市西乡塘区", "南宁市西乡塘区")

    params = {:wd => addr}.merge(DefaultParams)
    zipcode = DefaultZipCode
    try_count = 0
    begin
      try_count += 1
      res = http.get(ApiUrl, :params => params).flush

      if res.code == 200
        doc = Nokogiri::HTML.parse(res.body, nil, "gbk")
        first_e = doc.xpath("//section//article//ul//li//a").first
        zipcode = first_e.text.split(" ").last if first_e
        if zipcode == DefaultZipCode
          element = doc.xpath("//section//article//table//tr//td").first
          zipcode = element.text if element
        end

        if zipcode.length != 6
          puts "没有找到您要的邮编"
        end
      end
    rescue Exception => e
      if try_count < 6
        http.close if http
        http = HTTP.persistent ApiHost
        sleep(try_count)
        retry
      end
    end

    zipcode
  end

end
