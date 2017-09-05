require "nokogiri"
require "open-uri"
require 'uri'

#url = "http://media.daum.net/breakingnews/economic"
#doc =Nokogiri::HTML(doc=open(url))
#doc.xpath('//div[@class="cont_thumb"]/strong/a').each do |a|  
#  puts a.content
#end  
   
class Notice < ApplicationRecord
    validates :link, :uniqueness => true
    
    def self.crawling(keyw)
        
       
        for i in 1..2
            page=i*10

            url=URI.encode("https://www.google.co.kr/search?q=#{keyw}&biw=1740&bin=540&gbv1&tbm=nws#ei=&start=#{page}&sa=N")
                
                data = Nokogiri::HTML(open(url).read.encode("UTF-8"))
                contents = data.css("div.g")
                contents.each do |notice|
                    p notice  #하나하나 디버깅하기 따로뺴서 로그를 지속적으로 확인해야한다. 
                    p "===="
                    p notice.css("h3")[0]
                    p "===="
                    title = notice.css("h3> a.a").text.strip
                    link = notice.css("h3> a")[0]["href"].strip
                    writer = notice.css("h3> dive.slp> span.f").text.strip
                    p title #p는 
                    p link
                    p writer
                    Notice.create(
                        :title => title,
                        :link => link,
                        :writer => writer,
                        )end
                    
        end
    end
    
#    def self.crawling(keyw)
#        for i in 1..10 
#    
#            d_url="http://search.daum.net/search?w=news&nil_search=btn&DA=PGD&enc=utf8&cluster=y&cluster_page=1&q=#{keyw}&p=#{i}"
            
#            data = Nokogiri::HTML(open(d_url))
#            contents = data.css("div.wrap_tit mg_tit")
#            contents.each do |notice|
#                p notice  #하나하나 디버깅하기 따로뺴서 로그를 지속적으로 확인해야한다. 
#                title_d = notice.css("wrap_tit mg_tit a.f_link_b").text.strip
#                link_d = notice.css("wrap_tit mg_tit a.f_link_b")[0]["href"].strip
#                writer_d = notice.css("span.f_nb date span.txt_bar").text.strip
#                p title_d #p는 
#                p link_d
#                p writer_d
#               Notice.create(
#                    :title => title_d,
#                    :link => link_d,
#                    :writer => writer_d,
#                    )
#            end
#        end
#    end
end
