# frozen_string_literal: true

class ZozoController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    url = 'http://zozo.jp/ranking/all-sales-men.html'

    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    @hoge2 = doc.xpath('//div[@class="catalog-header-h"]')
    @hoge1 = doc.xpath('//img[@class="catalog-img loader"]').map { |alt| alt.attr('alt') }
    @hoge = doc.xpath('//img[@class="catalog-img loader"]').map { |img| img.attr('src') }
   end

  def woindex
    url = 'https://zozo.jp/ranking/all-sales-women.html'

    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    @hoge1 = doc.xpath('//img[@class="catalog-img loader"]').map { |alt| alt.attr('alt') }
    @hoge = doc.xpath('//img[@class="catalog-img loader"]').map { |img| img.attr('src') }
  end
end
