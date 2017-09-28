require "nokogiri"
require "open-uri"
require 'uri'

class Notice < ApplicationRecord
    validates :title, :uniqueness => true
    
    def self.crawling
        
       
        #for i in 1..42
        
            
        #    url=URI.encode("http://platum.kr/page/#{i}?s=인공지능")
                     
        #    data = Nokogiri::HTML(open(url).read.encode("UTF-8"))
            
            
        #    @contants = data.css("div.post_header")
            
            
        #    @contants.each do |contant|
                  #하나하나 디버깅하기 따로빼서 로그를 지속적으로 확인해야한다. 
                
        #        title = contant.css("div.post_header_title.two_third.last").text.strip
        #        writer = contant.css("span.post_info_author").text.strip
        #        link = contant.css("a")[0]['href'].strip
                
        #        p title 
        #        p writer
        #        p link
                
        #       Notice.create(
        #            :title => title,
        #            :writer => writer,
        #            :link => link,)
                
        #        end
        #end
       
       
       
       
       
       
        for i in 1..30
        
            
            url=URI.encode("http://media.daum.net/breakingnews/?page=#{i}")
                     
            data = Nokogiri::HTML(open(url).read.encode("UTF-8"))
            
            
            @contants = data.css("div.cont_thumb")
            
            
            @contants.each do |contant|
                  #하나하나 디버깅하기 따로빼서 로그를 지속적으로 확인해야한다. 
                
                title = contant.css("a.link_txt").text.strip
                writer = contant.css("span.info_news").text.strip
                link = contant.css("a.link_txt")[0]['href'].strip
                
                p title 
                p writer
                p link
                
               Notice.create(
                    :title => title,
                    :writer => writer,
                    :link => link,)
                
                end
        end
    end
end