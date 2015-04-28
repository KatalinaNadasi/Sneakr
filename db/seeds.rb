# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brand = Brand.create(name: 'nike')
Shoe = Shoe.create(name: 'Nike Air Max 1', brand: brand, description: "La Nike Air Max est un modèle
de basket créée pour Nike en 1987 par Tinker Hatfield, designer chez Nike. La Air Max relança d'ailleurs
l'entreprise qui était sur le point de faire faillite. La légende veut que Tinker Hatfield se soit inspiré
de l'architecture du centre Beaubourg de Paris pour la conception de la Nike Air Max.")
Shoe.create(name: 'Nike Air Max 95', brand: brand, description:"La Nike Air Max 95 a été conçue par le designer
Sergio Lozano qui s’est inspiré de l’anatomie humaine, notamment de la colonne vertébrale, des côtes et des tendons.
Son look original et son mini swoosh situé au niveau du talon en font l’un des modèles les plus populaires
de la marque. Le coloris le plus connu est la Nike Air Max 95 OG Neon. D’après une étude anglaise sur le footwear
parue en 2007, la Nike Air Max 95 était le premier choix des criminels.")
Shoe.create(name: 'Nike Air Max 90', brand: brand, description:"Introduite en 1990, la Nike Air Max 90 succède à la Nike Air Max 1
et à la Nike Air Max Light, elle a été conçue par le designer Tinker Hatfield et était appelée Nike Air Max III
jusqu’en 2000.")
Shoe.create(name: 'Nike Free 5.0', brand: brand, description:"Idéale pour les coureurs qui découvrent
la technologie Nike Free, la chaussure de running Nike Free 5.0 offre un excellent amorti en toute
légèreté et un maintien optimal tout en procurant une expérience de running naturelle.")
Shoe.create(name: 'Nike Dunk', brand: brand, description:"Soyez fidèle : aux couleurs de votre école,
à votre école de pensée. C'est la devise de la Nike Dunk depuis son lancement en 1985. Cette année-là,
sept équipes universitaires de basket-ball ont décidé de casser les codes du sport en choisissant d'assortir
leurs chaussures Nike Dunk à leur tenue. Cette nouvelle tendance a fait naître une explosion de couleurs,
et la Nike Dunk est depuis devenue un symbole de l'expression individuelle. Basketteurs, skateurs et collectionneurs
se sont emparés de ce modèle de chaussure et continuent à influencer son évolution.")
Shoe.create(name: 'Nike Air Mariah PR', brand: brand, description:"C’est le premier modèle de running ultra-léger
doté d’un upper sans coutures, empruntant les caractéristiques de la Nike Eagle. La semelle inclut une
unité Air-Sole au talon qui protège parfaitement des impacts et offre un amorti optimal.")
Shoe.create(name: 'Nike Air Huarache', brand: brand, description:"La Nike Air Huarache a été imaginée
par Tinker Hatfield en 1991. A la base, le designer voulait l’appeler Harrachi mais a changé pour
Huarache en référence aux sandales amérindiennes du même nom. Il s’est inspiré des chaussons de ski nautique
pour le design et a utilisé du néoprène pour le upper. Nike a conçu de nombreuses versions de la Nike Air Huarache:
une version Light, Air Flight pour le basketball, Racer, Triax, International, Burst, Air Trainer, Cross Trainer,
Tech Challenge et Free.")
Shoe.create(name: 'Nike Cortez', brand: brand, description:"Sur les pistes depuis 1972, la Nike Cortez a révolutionné
le monde du running grâce à la vision novatrice de l'entraîneur d'athlétisme Bill Bowerman. Son idée était simple :
créer une chaussure de running aussi confortable que résistante. Le résultat a permis à ses athlètes de courir plus
longtemps et plus rapidement, mais a également révolutionné ce sport.")
Shoe.create(name: 'Nike Flyknit Racer', brand: brand, description:"La technologie Nike Flyknit s'inspire des indications
des coureurs désireux de posséder une chaussure aussi confortable qu'une chaussette et procurant la sensation decourir
pieds nus. Après 4 ans de recherche les ingénieurs et designers ont réfléchi à la création de la technologie nécessaire,
résultat : une empeigne quasiment sans couture, ajustée et ultra-légère.")
Shoe.create(name: 'Nike Air Max tavas', brand: brand, description:"La chaussure Nike Air Max Tavas pour
Homme rappelle la coupe rétro de l'emblématique modèle de running original avec une unité Max Air au talon
et une semelle extérieure à motif gaufré pour une adhérence sur différentes surfaces.")



  Adidas_list = ['Adidas Stan Smith', 'Adidas Superstar', 'Adidas ZX Flux',
'Adidas Energy Boost', 'Adidas Originals Tubular', 'Adidas Yeezy 750',
'Adidas Superstar', 'Adidas Gazelle', 'Adidas nastase']




