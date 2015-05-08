require 'nokogiri'
require 'open-uri'
require 'yaml'

Brand.destroy_all

data = YAML.load_file(File.join(Rails.root, "db", "seed.yml"))

data.each do |brand_data|
  brand = Brand.create(name: brand_data["name"], photo_url: brand_data["photo_url"])
  brand_data["shoes"].each do |shoe_data|
    Shoe.create(name: shoe_data["name"], description: shoe_data["description"], brand: brand, picture: open(shoe_data["url"]))
  end
end

ebay      = Store.where(name: "ebay", url: "http://www.ebay.fr/").first_or_create!
leboncoin = Store.where(name: "leboncoin", url: "http://www.leboncoin.fr/").first_or_create!

Shoe.all.each do |shoe|
  # Ebay - Achat Immediat - Page 1 - 48 baskets
  params = { _nkw: shoe.name }.to_query
  url = "http://www.ebay.fr/sch/Baskets-/15709/i.html?LH_BIN=1&#{params}"
  p url
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.sresult').each do |element|
    result = Result.new

    result.price = element.search('.amt').text.gsub('EUR', '').gsub(',', '.').strip.to_f
    result.picture_url = element.search('.imgWr2 img.img').attribute('src').text
    result.title = element.search('.gvtitle a').text
    result.size = nil
    result.shoe = shoe
    result.url = element.search('.gvtitle a').attribute("href").text
    result.store = ebay

    result.save!
  end

  # Le bon coin - Page 1 - 35 Chaussures
  params = { q: shoe.name }.to_query
  url = "http://www.leboncoin.fr/chaussures/offres/nord_pas_de_calais/occasions/?f=a&th=1&#{params}"

  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.list-lbc a').each do |element|
    result = Result.new
    next if element.search('.image img').empty?

    result.price = element.search('.price').text.gsub("€", "").strip
    result.picture_url = element.search('.image img').attribute('src').text
    result.title = element.search('.title').text.strip
    result.size = nil
    result.shoe = shoe
    result.url = element.attribute("href").text
    result.store = leboncoin

    result.save!
  end
end

leboncoin.results.where(size: nil).each do |result|
  begin
    html_file = open(result.url)
    html_doc = Nokogiri::HTML(html_file)

    size = html_doc.search(".criterias tr").text.gsub("\n", "").strip.match(/Pointure :\s*(\d+)/)

    if size
      result.size = size[1]
      result.save
    else
      puts "Announce does not have size: #{result.url}... destroyed"
      result.destroy
    end
  rescue OpenURI::HTTPError => e
    if e.message == "404 Not Found"
      puts "Announce does not exist anymore: #{result.url}... destroyed"
      result.destroy
    end
  end
end

ebay.results.where(size: nil).each do |result|
  html_file = open(result.url)
  html_doc = Nokogiri::HTML(html_file)

  unavailable = html_doc.search(".msgTextAlign").text.include?("plus disponible")

  if unavailable
    puts "Announce does not exist anymore: #{result.url}... destroyed"
    result.destroy
    next
  end

  uk_size = html_doc.search(".itemAttr td").text.gsub("\t", "").gsub("\n", "").match(/Shoe Size: (UK \d+\.*\d*)/)
  fr_size = html_doc.search(".itemAttr td").text.gsub("\t", "").gsub("\n", "").match(/Pointure: (\d+,*\d*)/)

  if uk_size
    result.size = uk_size[1].to_f
    result.save
  elsif fr_size
    result.size = fr_size[1].to_f
    result.save
  else
    puts "Announce with many or no size: #{result.url}..."
  end
end

# html_doc.search("select[name='Taille'] option").map { |elm| elm.text }
# => ["- SÃ©lectionner -", "44", "UK 10"]
# html_doc.search("select[name='Size'] option").map { |elm| elm.text }
# => ["- SÃ©lectionner -", "UK Sz 4    = (US 4.5, EUR 36 2...", ...]
