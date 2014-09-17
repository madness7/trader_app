require 'nokogiri'
require 'open-uri'
require "pry"

begin_time = Time.now

url = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.industry%20where%20id%20in%20(select%20industry.id%20from%20yahoo.finance.sectors)&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
doc = Nokogiri::XML(open(url))


Stock.delete_all

doc.css("query results industry").each do |industry|
  puts industry.attribute("name")
  industry.css("company").each do |company|
    company_name = company.attribute("name").to_s
    company_symbol = company.attribute("symbol").to_s
    Stock.create(name: company_name, symbol: company_symbol)
  end
end

end_time = Time.now

puts "#{end_time.to_i - begin_time.to_i} seconds"