desc "Rake task to scrape the data from onemobile.com"
require "net/http"
namespace :crawl do
  task :insidefacebook => :environment do
          html = open("/home/kannan/Desktop/facebookapps.html")
          doc = Nokogiri::HTML(html) 
          doc.xpath("//div[@class='post-body']/li/a").each do |div| 
                p FacebookAppList.create!(:app_url => div.attributes['href'].value,
                                          :app_name => div.inner_text)
          end
  end
end