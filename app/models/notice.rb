require "nokogiri"
require "open-uri"
require 'uri'


class Notice < ApplicationRecord
    validates :link, :uniqueness => true
    
    def self.crawling
        
       
        for i in 1..10
        
            
            url=URI.encode("http://media.daum.net/breakingnews/?page=#{i}")
                     
            data = Nokogiri::HTML(open(url).read.encode("UTF-8"))
            
            
            contents = data.css("div.cont_thumb")
            
          
            
            contents.each do |notice|
                  #하나하나 디버깅하기 따로뺴서 로그를 지속적으로 확인해야한다. 
                
                title = notice.css("a.link_txt").text.strip
                writer = notice.css("span.info_news").text.strip
                
                p title 
                p writer
               Notice.create(
                    :title => title,
                    :writer => writer,
                    )
                end
        end
    end
end