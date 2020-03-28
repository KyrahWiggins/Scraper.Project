class Scraper

    attr_accessor :parse_page

    def intialize 
doc = HTTParty.get("https://us.shein.com/Necklaces-c-1755.html?icn=necklaces&ici=us_tab01navbar08menu09dir01&srctype=category&userpath=category%3EWOMEN%3ESHOES-ACC%3EJewelry%3ENecklaces&scici=navbar_2~~tab01navbar08menu09dir01~~8_9_1~~real_1755~~~~0~~0&tag_ids=40001711")
@parse_page ||= Nokogiri: : HTML(doc) # memorized the @parse_page so it only gets assigned one time
end

def get_names
name = parse_page.css (".grid-item-info").css(".product-name").ccs("p").children.map {|name| name.text}.compact

def get_prices
price = parse_page.css(".grid-item-info").css(".product-price").ccs("span.local").children.map {|price| price.text}.compact

private

def item_container
    parse_page.css(".grid-item-info")
end

scraper = Scraper.new
names = scraper.get_names
prices= scraper.get_prices

(0...prices.size).each do |index|
    puts "- - - index: #{index + 1} - - -"
    puts "Name: #{names[index]} | price: #{prices[index]}"
end
end
