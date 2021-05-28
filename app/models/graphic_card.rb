class GraphicCard < ApplicationRecord
  require 'open-uri'
  REGEX = /(3060|3070|3080|6800|3090|6900)/


  def self.generate_alfa
    doc = Nokogiri::HTML(URI.open('https://www.alfa.cz/index.php?eid=15L1K007K'))
    shop = 'ALFA'
    GraphicCard.where(shop: shop).destroy_all
    doc.search('.goods .item').each do |link|
      name = link.search('.descr h3').first.content
      price = link.search('.price strong').first.content
      stock = link.search('.stocks a').first.content
      link = 'https://alfa.cz' + link.search('.descr h3 a').first['href']
      iden = link.match(/\=(.*)/)[1]
      
      next unless name.match?(REGEX)

      GraphicCard.create(name: name, price: price, stock: stock, link: link, shop: shop, identifier: iden)
    end
  end

  def self.generate_alza
    doc = Nokogiri::HTML(URI.open('https://www.alza.cz/graficke-karty-nvidia-geforce-rtx-30/18881565.htm'))
    shop = 'ALZA'
    GraphicCard.where(shop: shop).destroy_all
    doc.search('#boxes .box').each do |link|
      name = link.search('.top .fb .name').first&.content
      price = link.search('.bottom .price .priceInner .c2').first&.content
      stock = link.search('.bottom .avl .avlVal').first&.content
      link = 'https://alza.cz' + link.search('.top .fb .name').first['href']
      iden = link.match(/(\-)(?!.*\1)(.*)\.htm/)[2]
      
      next unless name.match?(REGEX)

      GraphicCard.create(name: name, price: price, stock: stock, link: link, shop: shop, identifier: iden)
    end
  end

  def self.generate_czc
    doc = Nokogiri::HTML(URI.open('https://www.czc.cz/herni-spicka/produkty'))
    shop = 'CZC'
    GraphicCard.where(shop: shop).destroy_all
    doc.search('#tiles .new-tile').each do |link|
      name = link.search('.overflow .tile-title h5').first&.content&.strip
      price = link.search('.price-vatin').first&.content&.strip || 'Neznama'
      stock = link.search('.stores-and-delivery').first&.content&.strip || 'Neni k dispozici'
      link = 'https://czc.cz' + link.search('.overflow .tile-title h5 a').first['href']
      iden = link.match(/(?<=\/)[^\/]*(?=\/[^\/]*$)/).to_s

      next unless name.match?(REGEX)

      GraphicCard.create(name: name, price: price, stock: stock, link: link, shop: shop, identifier: iden)
    end
  end
end
