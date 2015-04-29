# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
brand = Brand.create(name: "Adidas")

Shoe.create(name:"Adidas Stan Smith", brand: brand, description: "Commercialisée en 1964 sous le nom d'Adidas Robert Haillet du nom du joueur de tennis français qui l'a conçue. La paire est typique : blanche, cuir aéré par trois rangés de trous, couleure verte à l'arrière avec le logo de la marque.
  Explosion des ventes suite au buzz d'Adidas et le lancement de l'arrêt de la production en 2011 puis de l'annonce du retour de sa production sur le réseaux sociaux pour 2014. Annonce en janvier 2014 du nouveau modèle qui s'est arraché. Léger essoufflement à prévoir. Exaspération de taggeurs-fou qui s'amusent à colorer les Stans Smith des piétons.")

Shoe.create(name: "Adidas Superstar", brand: brand, description: "Imaginée en 1969 par Adi Dassler, le fondateur de la marque. A l'origine concue pour jouer au basket elle est devenue l’emblème d’un style de vie street et hip hop grace à des légendes du rap comme Run-DMC. Probablement la chaussure qui exerce une influence durable sur la culture d’aujourd’hui.
  Retour progressif depuis début décembre dernier avec le retour d’une Superstar ‘Made in France’ et campagne vidéo officielle de la campagne ‘Superstar’ avec Pharrell Williams, David Beckham, Rita Ora et Damian Lillard.")

Shoe.create(name: "Adidas ZX Flux", brand: brand, description:"Petite soeur de la ZX 8000 née en 1989, la ZX Flux Originals dévoilé le 29 mars 2014, s’exporte hors des stades pour frapper le béton de la street.
  Elle reprend l’ADN de la ZX 8000 en y associant une touche très actuelle voire techno, tranchant avec les modèles vintages et rapidement adopté par le cool.")

Shoe.create(name: "Adidas Energy Boost", brand: brand, description:
  "Test d'une révolution l'Energie Boost à été inventée en 2013 avec une semelle intermédiaire en matière boost qui offre un amorti moelleux et dynamique.
  Belle nouvelle pour les coureurs d'aujourd'hui")

Shoe.create(name:"Adidas Yeezy 750", brand: brand, description:
  "Présentée par Kanye West en février dernier. Malgré une couverture médiatique considérable elle divise la communauté avec un look plus mode voire poseur.")

Shoe.create(name: 'Adidas nastase', brand: brand, description:"Une des stars chez Adidas tionnel elle a été inventée par un célèbre tennisman roumain du même nom.""Le classique indémodable et toujours classe.")

Shoe.create(name: 'Adidas Gazelle', brand: brand, description:"La gazelle fête ses 40 ans, elle est la première paire créée pour être multisports, première paire lifestyle ?
  Mince, gracieuse, au design simple. Résolument la basket mythique et ultra classe. L’une des paires la plus actuelle de chez Adidas.")




