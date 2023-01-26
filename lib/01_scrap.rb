require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/'))

# mix and match css and xml:
crypto_name_array = []

doc.xpath('//td[3]').each do |link|  #peut fonctionner avec un search
    crypto_name_array << link.text 
end

#p crypto_name_array  contrôle


# Contrôle : puts doc.class

crypto_value_array = []

doc.xpath('//td[4]').each do |link|  #peut fonctionner avec un search
    crypto_value_array << link.text 
end

crypto_array = []

(crypto_name_array.length).times do |i|
    crypto_hash = Hash.new
    crypto_hash[crypto_name_array[i]] = crypto_value_array[i]
    crypto_array << crypto_hash
end

puts crypto_array.class
