require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/'))


# mix and match css and xml:
crypto_name_array = []

   
doc.xpath('//td[3]').each do |iterate|  #peut fonctionner avec un search
crypto_name_array << iterate.text  # importance du .text pour sortir uniquement la valeur de l'élément et non la balise 
                                   # Ajout à chaque itération d'un nouvel élément au tableau(array) Crypto_name_array

end
#p crypto_name_array  contrôle
# Contrôle : puts doc.class

crypto_value_array = []

doc.xpath('//td[4]').each do |iterate|  #peut fonctionner avec un search
    crypto_value_array << iterate.text  # Ajout à chaque itération d'un  nouvel élement au tableau(array) Crypto_value_array
end

crypto_array = []   # Création d'un Hash  autre possibilité: crypto_array = Hash.new  

(crypto_name_array.length).times do |i|   # nombre d'itérations = longueur des  2 arrays / 
    crypto_hash = Hash.new                # Création d'un Hash  - ATTENTION H majuscule !    
    crypto_hash[crypto_name_array[i]] = crypto_value_array[i]
    crypto_array << crypto_hash
end

puts  crypto_array
#puts crypto_array.class


def control (crypto_array)
    ctrl= crypto_array.length
end
