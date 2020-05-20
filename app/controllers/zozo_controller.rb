class ZozoController < ApplicationController
    require 'nokogiri'
    require 'open-uri'
  
    def index
        # スクレイピング先のURL
        url = 'http://zozo.jp/ranking/all-sales-men.html'
    
 
            charset = nil
        
            html = open(url) do |f|
              charset = f.charset # 文字種別を取得
              f.read # htmlを読み込んで変数htmlに渡す
            end
        
            # htmlをパース(解析)してオブジェクトを生成
            doc = Nokogiri::HTML.parse(html, nil, charset)

            
            @hoge2 = doc.xpath('//div[@class="catalog-header-h"]')
            @hoge1 = doc.xpath('//img[@class="catalog-img loader"]').map {|alt| alt.attr('alt') }
            # 人気アイテム表示
            @hoge = doc.xpath('//img[@class="catalog-img loader"]').map {|img| img.attr('src') }
             # urlの取得
            # @hoge2 = doc.xpath('//a[@class="catalog-link"]').map {|href| href.attr('href')}


     end



end
