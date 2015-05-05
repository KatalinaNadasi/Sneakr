require 'nokogiri'
require 'open-uri'
require 'yaml'

# Brand.destroy_all

# data = YAML.load_file(File.join(Rails.root, "db", "seed.yml"))

# data.each do |brand_data|
#   brand = Brand.create(name: brand_data["name"], photo_url: brand_data["photo_url"])
#   brand_data["shoes"].each do |shoe_data|
#     Shoe.create(name: shoe_data["name"], description: shoe_data["description"], brand: brand, picture: open(shoe_data["url"]))
#   end
# end

ebay      = Store.where(name: "ebay", url: "http://www.ebay.fr/").first_or_create!
leboncoin = Store.where(name: "leboncoin", url: "http://www.leboncoin.fr/").first_or_create!

# Shoe.all.each do |shoe|
#   # Ebay - Achat Immediat - Page 1 - 48 baskets
#   params = { _nkw: shoe.name }.to_query
#   url = "http://www.ebay.fr/sch/Baskets-/15709/i.html?LH_BIN=1&#{params}"

#   html_file = open(url)
#   html_doc = Nokogiri::HTML(html_file)

#   html_doc.search('.sresult').each do |element|
#     result = Result.new

#     result.price = element.search('.amt').text.gsub('EUR', '').gsub(',', '.').strip.to_f
#     result.picture_url = element.search('.imgWr2 img.img').attribute('src').text
#     result.title = element.search('.gvtitle a').text
#     result.size = nil
#     result.shoe = shoe
#     result.url = element.search('.gvtitle a').attribute("href").text
#     result.store = ebay

#     result.save!
#   end

#   # Le bon coin - Page 1 - 35 Chaussures
#   params = { q: shoe.name }.to_query
#   url = "http://www.leboncoin.fr/chaussures/offres/nord_pas_de_calais/occasions/?f=a&th=1&#{params}"

#   html_file = open(url)
#   html_doc = Nokogiri::HTML(html_file)

#   html_doc.search('.list-lbc a').each do |element|
#     result = Result.new
#     next if element.search('.image img').empty?

#     result.price = element.search('.price').text.gsub("€", "").strip
#     result.picture_url = element.search('.image img').attribute('src').text
#     result.title = element.search('.title').text.strip
#     result.size = nil
#     result.shoe = shoe
#     result.url = element.attribute("href").text
#     result.store = leboncoin

#     result.save!
#   end
# end

# leboncoin.results.where(size: nil).each do |result|
#   begin
#     html_file = open(result.url)
#     html_doc = Nokogiri::HTML(html_file)

#     size = html_doc.search(".criterias tr").text.gsub("\n", "").strip.match(/Pointure :\s*(\d+)/)

#     if size
#       result.size = size[1]
#       result.save
#     else
#       puts "Announce does not have size: #{result.url}... destroyed"
#       result.destroy
#     end
#   rescue OpenURI::HTTPError => e
#     if e.message == "404 Not Found"
#       puts "Announce does not exist anymore: #{result.url}... destroyed"
#       result.destroy
#     end
#   end
# end

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
    result.size = uk_size[1].float
    result.save
  elsif fr_size
    result.size = fr_size[1].float
    result.save
  else
    puts "Announce with many or no size: #{result.url}..."
  end
end

# html_doc.search("select[name='Taille'] option").map { |elm| elm.text }
# => ["- SÃ©lectionner -", "44", "UK 10"]
# html_doc.search("select[name='Size'] option").map { |elm| elm.text }
# => ["- SÃ©lectionner -", "UK Sz 4    = (US 4.5, EUR 36 2...", ...]






# brand = Brand.create(name: "Adidas")

# Shoe.create(name:"Adidas Stan Smith", brand: brand, description: "Commercialisée en 1964 sous le nom d'Adidas Robert Haillet du nom du joueur de tennis français qui l'a conçue. La paire est typique : blanche, cuir aéré par trois rangés de trous, couleure verte à l'arrière avec le logo de la marque.
#   Explosion des ventes suite au buzz d'Adidas et le lancement de l'arrêt de la production en 2011 puis de l'annonce du retour de sa production sur le réseaux sociaux pour 2014. Annonce en janvier 2014 du nouveau modèle qui s'est arraché. Léger essoufflement à prévoir. Exaspération de taggeurs-fou qui s'amusent à colorer les Stans Smith des piétons.")

# Shoe.create(name: "Adidas Superstar", brand: brand, description: "Imaginée en 1969 par Adi Dassler, le fondateur de la marque. A l'origine concue pour jouer au basket elle est devenue l’emblème d’un style de vie street et hip hop grace à des légendes du rap comme Run-DMC. Probablement la chaussure qui exerce une influence durable sur la culture d’aujourd’hui.
#   Retour progressif depuis début décembre dernier avec le retour d’une Superstar ‘Made in France’ et campagne vidéo officielle de la campagne ‘Superstar’ avec Pharrell Williams, David Beckham, Rita Ora et Damian Lillard.")

# Shoe.create(name: "Adidas ZX Flux", brand: brand, description:"Petite soeur de la ZX 8000 née en 1989, la ZX Flux Originals dévoilé le 29 mars 2014, s’exporte hors des stades pour frapper le béton de la street.
#   Elle reprend l’ADN de la ZX 8000 en y associant une touche très actuelle voire techno, tranchant avec les modèles vintages et rapidement adopté par le cool.")

# Shoe.create(name: "Adidas Energy Boost", brand: brand, description:
#   "Test d'une révolution l'Energie Boost à été inventée en 2013 avec une semelle intermédiaire en matière boost qui offre un amorti moelleux et dynamique.
#   Belle nouvelle pour les coureurs d'aujourd'hui")

# Shoe.create(name:"Adidas Yeezy 750", brand: brand, description:
#   "Présentée par Kanye West en février dernier. Malgré une couverture médiatique considérable elle divise la communauté avec un look plus mode voire poseur.")

# Shoe.create(name: 'Adidas nastase', brand: brand, description:"Une des stars chez Adidas tionnel elle a été inventée par un célèbre tennisman roumain du même nom.""Le classique indémodable et toujours classe.")

# Shoe.create(name: 'Adidas Gazelle', brand: brand, description:"La gazelle fête ses 40 ans, elle est la première paire créée pour être multisports, première paire lifestyle ?
#   Mince, gracieuse, au design simple. Résolument la basket mythique et ultra classe. L’une des paires la plus actuelle de chez Adidas.")
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
# brand = Brand.create(name: 'nike')

# Shoe = Shoe.create(name: 'Nike Air Max 1', brand: brand, description: "La Nike Air Max est un modèle
# de basket créée pour Nike en 1987 par Tinker Hatfield, designer chez Nike. La Air Max relança d'ailleurs
# l'entreprise qui était sur le point de faire faillite. La légende veut que Tinker Hatfield se soit inspiré
# de l'architecture du centre Beaubourg de Paris pour la conception de la Nike Air Max.")
# Shoe.create(name: 'Nike Air Max 95', brand: brand, description:"La Nike Air Max 95 a été conçue par le designer
# Sergio Lozano qui s’est inspiré de l’anatomie humaine, notamment de la colonne vertébrale, des côtes et des tendons.
# Son look original et son mini swoosh situé au niveau du talon en font l’un des modèles les plus populaires
# de la marque. Le coloris le plus connu est la Nike Air Max 95 OG Neon. D’après une étude anglaise sur le footwear
# parue en 2007, la Nike Air Max 95 était le premier choix des criminels.")
# Shoe.create(name: 'Nike Air Max 90', brand: brand, description:"Introduite en 1990, la Nike Air Max 90 succède à la Nike Air Max 1
# et à la Nike Air Max Light, elle a été conçue par le designer Tinker Hatfield et était appelée Nike Air Max III
# jusqu’en 2000.")
# Shoe.create(name: 'Nike Free 5.0', brand: brand, description:"Idéale pour les coureurs qui découvrent
# la technologie Nike Free, la chaussure de running Nike Free 5.0 offre un excellent amorti en toute
# légèreté et un maintien optimal tout en procurant une expérience de running naturelle.")
# Shoe.create(name: 'Nike Dunk', brand: brand, description:"Soyez fidèle : aux couleurs de votre école,
# à votre école de pensée. C'est la devise de la Nike Dunk depuis son lancement en 1985. Cette année-là,
# sept équipes universitaires de basket-ball ont décidé de casser les codes du sport en choisissant d'assortir
# leurs chaussures Nike Dunk à leur tenue. Cette nouvelle tendance a fait naître une explosion de couleurs,
# et la Nike Dunk est depuis devenue un symbole de l'expression individuelle. Basketteurs, skateurs et collectionneurs
# se sont emparés de ce modèle de chaussure et continuent à influencer son évolution.")
# Shoe.create(name: 'Nike Air Mariah PR', brand: brand, description:"C’est le premier modèle de running ultra-léger
# doté d’un upper sans coutures, empruntant les caractéristiques de la Nike Eagle. La semelle inclut une
# unité Air-Sole au talon qui protège parfaitement des impacts et offre un amorti optimal.")
# Shoe.create(name: 'Nike Air Huarache', brand: brand, description:"La Nike Air Huarache a été imaginée
# par Tinker Hatfield en 1991. A la base, le designer voulait l’appeler Harrachi mais a changé pour
# Huarache en référence aux sandales amérindiennes du même nom. Il s’est inspiré des chaussons de ski nautique
# pour le design et a utilisé du néoprène pour le upper. Nike a conçu de nombreuses versions de la Nike Air Huarache:
# une version Light, Air Flight pour le basketball, Racer, Triax, International, Burst, Air Trainer, Cross Trainer,
# Tech Challenge et Free.")
# Shoe.create(name: 'Nike Cortez', brand: brand, description:"Sur les pistes depuis 1972, la Nike Cortez a révolutionné
# le monde du running grâce à la vision novatrice de l'entraîneur d'athlétisme Bill Bowerman. Son idée était simple :
# créer une chaussure de running aussi confortable que résistante. Le résultat a permis à ses athlètes de courir plus
# longtemps et plus rapidement, mais a également révolutionné ce sport.")
# Shoe.create(name: 'Nike Flyknit Racer', brand: brand, description:"La technologie Nike Flyknit s'inspire des indications
# des coureurs désireux de posséder une chaussure aussi confortable qu'une chaussette et procurant la sensation decourir
# pieds nus. Après 4 ans de recherche les ingénieurs et designers ont réfléchi à la création de la technologie nécessaire,
# résultat : une empeigne quasiment sans couture, ajustée et ultra-légère.")
# Shoe.create(name: 'Nike Air Max tavas', brand: brand, description:"La chaussure Nike Air Max Tavas pour
# Homme rappelle la coupe rétro de l'emblématique modèle de running original avec une unité Max Air au talon
# et une semelle extérieure à motif gaufré pour une adhérence sur différentes surfaces.")

#   Adidas_list = ['Adidas Stan Smith', 'Adidas Superstar', 'Adidas ZX Flux',
# 'Adidas Energy Boost', 'Adidas Originals Tubular', 'Adidas Yeezy 750',
# 'Adidas Superstar', 'Adidas Gazelle', 'Adidas nastase']

