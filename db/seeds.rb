require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AssociationTag.destroy_all
Asso.destroy_all
Tag.destroy_all
SubCategory.destroy_all
Category.destroy_all


categories = [
    { cat: "Solidarité", sub_cat: ["Santé", "Dons", "Aide à la Personne", "Culture & Loisirs"] },
    { cat: "Assistance", sub_cat: %w{Harcelement Violences Abus} },
    { cat: "Financier", sub_cat: %w{Emploi Logement Transport Formation&Education Juridique} }
]

tags = {
    "Harcelement" => %w{Travail Conjugal Internet Moral Scolaire},
    "Violences" => %w{Psychologie Enfant Sexuel Femme Religion Policière Discrimination},
    "Abus" => %w{Prejudice Sénior Succession Fraude Vulnérabilité Manipulation},
    "Santé" => %w{Maladie Mutuelle Nutrition Bien-être Decès Complémentaire},
    "Aide à la Personne" => ["Aide à domicile", "Soin", "Mobilité", "Lien social", "Service", "Personne agée"],
    "Emploi" => %w{Chômage Insertion Offre Allocation Entrepreunariat},
    "Logement" => %w{Travaux Rénovation Annonce Immobilier Individuel Social Hébergement},
    "Transport" => %w{Déplacement Abonnement Gratuit Voiture Bus Métro},
    "Formation&Education" => %w{Reconversion Spécialisation Financement Entreprise Région AIF},
    "Juridique" => ["Droit", "Litige", "Procédure", "Conseil", "Démarche", "Faire appel"],
    "Culture & Loisirs" => %w{Sport Vacances Musée Activité Réduction Cours},
    "Dons" => ["Bon d'achat", "Paniers", "Dons", "Ticket restaurant", "Entraide"]
}

categories.each do |cat|
    category = Category.create!(name: cat[:cat])
    cat[:sub_cat].each do |subcat|
        subcategory = category.sub_categories.create!(name: subcat)
        if tags[subcat]
            tags[subcat].each do |tag|
                subcategory.tags.create!(name: tag)
            end
        end
    end
end

def set_asso(name, url, address, city, description, tags)
    file = URI.open(url)
    asso = Asso.new(
        name: name,
        address: address,
        city: city,
        description: description
        )

    asso.photo.attach(io: file, filename: 'image.png')
    asso.save!

    tags.each do |tag|
        AssociationTag.create!(asso: asso, tag: Tag.find_by(name: tag))
    end
end

associations = [
    {name: "ADMR", photo: "https://www.bainssuroust.fr/medias/2020/03/ADMR_baseline_JPG-scaled.jpg",address: "154, Rue des Pyrénées", city: "Paris", description: "Service d'aide à la personne. L'ADMR est un réseau associatif. Il intervient en France de la naissance à la fin de vie, dans quatre domaines : autonomie, services de confort à domicile, famille et santé. Il est constitué de 2 700 associations locales autonomes qui interviennent sur un territoire déterminé", tag: ["Aide à domicile", "Soin", "Service"]},
    {name: "Les Restos du coeur", photo: "https://causeaeffet.com/wp-content/uploads/2019/11/resto-du-coeur-logo.jpg", address: "4, CITE d'Hauteville", city: "Paris", description: "Les Restos ont pour but « d'aider et d'apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l'accès à des repas gratuits", tag: ["Bon d'achat", "Dons", "Entraide"]},
    {name: "Emmaüs", photo: "https://upload.wikimedia.org/wikipedia/fr/thumb/4/4d/Logo_EF_Couleur.svg/1200px-Logo_EF_Couleur.svg.png", address: "355, Rue des Pyrénées", city: "Montreuil", description: "Fidèle à la volonté de l'abbé Pierre, Emmaüs est devenu à la fois une fabrique d'innovations sociales et de solidarités pour aider des publics en situation de grande précarité", tag: ["Service", "Immobilier", "Social", "Entraide"]},
    {name: "Je t'aide", photo: "https://associationjetaide.org/wp-content/uploads/2020/07/logo-jetaide-scaled.jpg", address: "54, Rue Molière,", city: "Ivry-sur-Seine", description: "Luttons contre l'isolement social des aidant.es ! Notre mission est de faire avancer les droits des aidants auprès des pouvoirs publics pour qu’aider ne rime pas avec précarité.", tag: ["Service", "Lien social"]},
    {name: "Aurore Association", photo: "https://upload.wikimedia.org/wikipedia/fr/f/fe/Association_Aurore_logo.png",address: "180, Rue FBG St Antoine", city: "Paris", description: "Accueillir et accompagner vers l’autonomie les personnes en situation de précarité ou d’exclusion via l’hébergement, les soins et l’insertion.", tag: ["Insertion", "Soin", "Hébergement"]},
    {name: "La Croix Rouge", photo: "https://www.mairie-confolens.fr/medias/2018/02/Croix-Rouge-Francaise.jpg",address: "12, Rue Auguste Laurent", city: "Paris", description: "Ses missions fondamentales sont l'urgence, le secourisme, l'action sociale, la formation, la santé et l'action internationale.", tag: ["Soin", "Maladie", "Lien social"]},
    {name: "Petits frères des Pauvres", photo: "https://www.pagesjaunes.fr/media/ugc/les_petits_freres_des_pauvres_06748200_150135878" ,address: "16, bis AV Parmentier,", city: "Paris", description: "Lutter contre l’isolement et la solitude des personnes âgées", tag: ["Personne agée", "Entraide"]},
    {name: "Secours Populaire", photo: "https://www.tousbenevoles.org/images/association/1418310045.jpg",address: "9, Rue Froissart", city: "Paris", description: "En France, le Secours populaire français intervient dans les domaines de l’aide alimentaire, vestimentaire, de l’accès et du maintien dans le logement, de l’accès aux soins, de l’insertion socioprofessionnelle, de l’accès à la culture et plus généralement de l’accès aux droits pour tous.", tag: ["Insertion", "Soin", "Immobilier"]},
    {name: "Fondation Abbé Pierre", photo: "https://infodon.fr/wp-content/uploads/2019/09/FAP.png",address: "78, Rue de la Réunion", city: "Paris", description: "La Fondation Abbé Pierre agit contre le mal-logement et l'exclusion aux côtés des plus démunis.", tag: ["Lien social", "Entraide", "Hébergement"]},
    {name: "Médecins Sans Frontières", photo: "https://upload.wikimedia.org/wikipedia/fr/thumb/6/69/MSF.svg/1200px-MSF.svg.png",address: "8, Rue Saint-Sabin", city: "Paris", description: "MSF apporte une assistance médicale aux populations menacées, en France ou à l’étranger.", tag: ["Soin", "Maladie", "Nutrition"]},
    {name: "Handicap International", photo: "https://infodon.fr/wp-content/uploads/2019/09/HI.png",address: "104/106, Rue Oberkampf", city: "Paris", description: "Handicap International vient en aide aux populations vulnérables, notamment les personnes handicapées, partout dans le monde où cela est nécessaire.", tag: ["Lien social", "Mobilité", "Maladie"]},
    {name: "Unicef", photo: "https://jamaity.org/wp-content/uploads/2014/05/logo_ptf_unicef.jpg",address: "3, Rue Duguay-Trouin,", city: "Paris", description: "UNICEF travaille dans les endroits les plus inhospitaliers du monde pour atteindre les enfants et les adolescents les plus défavorisés.", tag: ["Soin", "Hébergement", "Droit"]},
    {name: "Armée du Salut", photo: "https://www.francebenevolat.org/sites/default/files/relais/ArmeeduSalut_TEST400x210.jpg",address: "60, rue des Frères Flavien", city: "Paris", description: "Pour lutter contre l'exclusion sociale et faciliter l'insertion sociale et professionnelle", tag: ["Hébergement", "Insertion", "Lien social"]},
    {name: "Entraides Citoyennes", photo: "https://entraides-citoyennes.org/wp-content/uploads/2020/11/Logoo.png",address: "49, Rue des Vinaigriers", city: "Paris", description: "Entraides Citoyennes est une association loi 1901 qui vient en aide aux sans-abris.", tag: ["Hébergement", "Soin", "Paniers"]},
    {name: "Refettorio", photo: "https://refettorioparis.com/images/logo_big@2x.png",address: "Place de la Madeleine", city: "Paris", description: "Le Refettorio Paris est un restaurant solidaire situé dans la crypte de l'église de la Madeleine, au coeur de Paris.", tag: ["Paniers", "Entraide"]},
    {name: "Petits Princes", photo: "https://infodon.fr/wp-content/uploads/2019/09/Association-Petits-princes.jpg",address: "66, AV du Maine", city: "Paris", description: "L'Association Petits Princes, créée en 1987, réalise les rêves des enfants et des adolescents gravement malades.", tag: ["Soin", "Maladie", "Mobilité"]},
    {name: "Collectif Solidaire", photo: "https://www.rungisinternational.com/wp-content/uploads/2020/04/IMG_0442-532x520.jpg" ,address: "3, Rue de la Solidarité", city: "Paris", description: "L'association Collectif Solidaire est un collectif de citoyens et de chefs qui viennent en aide aux plus démunis en leur apportant des soutiens alimentaires", tag: ["Dons", "Entraide"]},
    {name: "Nous toutes", photo: "https://www.noustoutes.org/wp-content/uploads/2020/09/Blanc-sur-violet.png",address: "25, rue Popincourt", city: "Paris", description: "Le collectif #NousToutes est un collectif féministe engagé contre les violences sexistes, sexuelles, économiques, psychologiques, verbales et physiques faites aux femmes.", tag: ["Femme", "Sexuel", "Moral"]},
    {name: "Women Safe", photo: "https://www.lavilladescreateurs.com/wp-content/uploads/2020/02/unnamed1-e1581603075607.png",address: "9, Rue Armagis", city: "Saint-Germain-en-Laye ", description: "Prise en charge pluridisciplinaire des violences - Accompagnement global des femmes et enfants victimes de violences", tag: ["Femme", "Psychologie", "Conjugal", "Enfant"]},
    {name: "La Maison Des Femmes", photo: "https://pbs.twimg.com/profile_images/771718914875265024/cU42cDRT_400x400.jpg",address: "163, Rue de Charenton", city: "Paris", description: "Une maison, pour accueillir toutes les femmes vulnérables ou victimes de violence.", tag: ["Femme", "Vulnérabilité", "Conjugal"]},
    {name: "Mains Paillettes", photo: "https://pbs.twimg.com/profile_images/1341730106998460417/4Tjnc378_400x400.jpg", city: "Paris", description: "Collectif Queer Sourd•e•s & Entendant•e•s signant•e•s", tag: ["Lien social", "Service"]},
    {name: "En avant toute(s)", photo: "https://www.carenews.com/sites/default/files/styles/large_actualites/public/articles/1ce45f1bc58753fbf030523fa5eafce8b44ad809_0.jpg?itok=mnSrQCmg", city: "Paris", description: "En avant toute(s) est une association qui agit pour l'égalité femmes-hommes et la fin des violences.", tag: ["Femme", "Discrimination", "Psychologie"]},
    {name: "Centre Hubertine Auclert", photo: "https://www.mnemosyne.asso.fr/mnemosyne/wp-content/uploads/2020/06/logo-hubertine-auclert.jpg" ,address: "7, PL des Cinq Martyrs du Lycée Buffon", city: "Paris", description: "Le centre Hubertine-Auclert est un espace d’information et d’expertise dont l’objectif est de promouvoir une culture de l’égalité entre femmes et hommes.", tag: ["Femme", "Discrimination", "Psychologie"]},
    {name: "Planning Familial", photo: "https://www.madmoizelle.com/wp-content/uploads/2015/12/planning-familial-utilite-temoignages.jpg",address: "4, SQ St Irénée", city: "Paris", description: "Le planning familial est un mouvement féministe et d’éducation populaire, le Planning Familial milite pour le droit à l’éducation à la sexualité, à la contraception, à l’avortement, à l’égalité.", tag: ["Femme", "Soin", "Lien social"]},
    {name: "Caisse d'allocation Familiale", photo: "https://i.pinimg.com/originals/95/65/bf/9565bf543183bb0f4b034b004de43053.jpg",address: "67-69, AV Jean Jaurès", city: "Paris", description: "La Caisse d’allocation Familiale privilégie l’accompagnement des familles dans leur vie quotidienne, l’accueil du jeune enfant, l’accès au logement et lutte contre la précarité.", tag: ["Immobilier", "Insertion", "Entraide", "Hébergement"]},
    {name: "Enfants des Citadelles", photo: "https://scontent.fcdg2-1.fna.fbcdn.net/v/t1.0-9/67526844_884151628617456_3440865478132629504_n.jpg?_nc_cat=104&ccb=3&_nc_sid=09cbfe&_nc_ohc=A7XfbvRaK4QAX-PPLuy&_nc_ht=scontent.fcdg2-1.fna&oh=50aea656084bd25ee947faee1d8f6ecb&oe=605BC9C2",address: "10 rue de Chaumont", city: "Paris", description: "L’association Les Enfants des citadelles a pour objectifs l’accès à l’éducation, à la culture, à la santé et au bien être des enfants démunis à travers le monde, Elle récolte des dons et les redistribue aux enfants en situation de précarité.", tag: ["Maladie", "Entraide", "Soin"]},
    {name: "Papillons Blanc de Paris", photo: "https://www.tousbenevoles.org/images/association/1418313974.png",address: "85, Rue la Fayette", city: "Paris", description: "Les papillons blanc de paris accompagne les personnes atteintes d’un handicap mental et leur famille.", tag: ["Soin", "Maladie", "Lien social", "Mobilité"]},
    {name: "Fondation Jean et Jeanne Scelles", photo: "https://stockagehelloassoprod.blob.core.windows.net/images/photos/124424-a6f74cf66d914e4ebace7d61d676a313_kr782x550.jpg",address: "bât 2, 14 Rue Mondétour,", city: "Paris", description: "La Fondation Jean-et-Jeanne-Scelles a pour but d’agir sur les causes et les conséquences de la prostitution en vue de sa disparition. Elle estime que la prostitution est une atteinte aux droits humains d’égalité, de dignité ainsi qu’une source de violences sociales et personnelles.", tag: ["Sexuel", "Femme", "Moral"]},
    {name: "Action contre la Faim", photo: "https://findvectorlogo.com/wp-content/uploads/2020/04/action-contre-la-faim-vector-logo.png",address: "14/16, Boulevard Douaumont", city: "Paris", description: "Action contre la faim a pour objectifs d’éliminer la faim par la prévention, la détection et le traitement de la sous-nutrition, en particulier pendant et après les situations d’urgence liées aux conflits et aux catastrophes naturelles.", tag: ["Entraide", "Dons"]},
    {name: "Solidarités Nouvelles face au Chômage", photo: "https://www.lesclayessousbois.fr/resources/Solidarites-nouvelles-face-au-chomage.jpg",address: "51, Rue de la Fédération", city: "Paris", description: "Solidarités nouvelles face au chômage a pour mission d’accompagner des personnes sans emploi. Sa méthode d’accompagnement est basée sur la reconstruction du lien social et la revalorisation des personnes au chômage.", tag: ["Lien social", "Chômage", "Insertion"]},
    {name: "Secours Catholique", photo: "https://www.tousbenevoles.org/images/action/image-156.jpg",address: "13, Rue Saint-Ambroise", city: "Paris", description: "Le Secours catholique est attentif aux problèmes de pauvreté et d’exclusion de tous les publics et cherche à promouvoir la justice sociale.", tag: ["Droit", "Entraide", "Insertion"]},
    {name: "APF France handicap", photo: "https://www.tousbenevoles.org/images/association/1527755140.png",address: "17, BD Auguste Blanqui", city: "Paris", description: "APF France handicap est un mouvement national de défense et de représentation des personnes en situation de handicap moteur avec ou sans troubles associés et de leur famille et est reconnue d’utilité publique.", tag: ["Lien social", "Mobilité", "Soin"]},
    {name: "Soutiens Insertion Santé", photo: "http://soutien-insertion-sante.fr/wp-content/uploads/2019/08/image-1.png",address: "181, Rue de Tolbiac", city: "Paris", description: "Soutiens insertion Santé propose un accompagnement psycho-social, social et professionnel. Il est réalisé par une équpe pluridisciplinaire (psychologues, psychologue du travail, CIP, chargée d’insertion socioprofessionnelle, agent administratif et d’accueil, direction).", tag: ["Insertion", "Soin", "Offre"]},
    {name: "Viens voir mon Taf", photo: "https://miro.medium.com/max/1000/1*EDYQmYWD_6Cx82rUaTkghA.png",address: "29, boulevard Bourdon", city: "Paris", description: "Viens voir mon Taf permet aux collégiens sans réseau de l’éducation prioritaire de faire des stages de troisième motivants, de qualité, et pertinents pour leur orientation !", tag: ["Insertion", "Offre", "Lien social"]},
    {name: "TANDEM réfugiés", photo: "https://storage.benevolt.fr/55ca0690-1f50-48c9-bd5e-3bf986aaf3a0/c/logo-tandem-rouge-carre-avatar.jpg",address: "30, rue Jacob", city: "Paris", description: "Tandem Réfugiés est né à l’initiative de deux parisiennes, l’association accompagne des personnes réfugiées dans leur insertion en France.", tag: ["Insertion", "Offre", "Lien social", "Droit"]},
    {name: "Bouée d'espoir", photo: "https://www.commeon.com/sites/default/files/bouee-despoir-logo-fondation.png",address: "90, rue de l’Assomption", city: "Paris", description: "Bouée d’espoir fait front contre l’exclusion par une action de partage, concrète et suivie. L’association s’oppose à la dynamique de marginalisation et d’exclusion qui touche de plus en plus d’individus de tous âges et de toutes origines.", tag: ["Lien social", "Psychologie", "Entraide"]},
    {name: "Les auxiliaires des aveugles", photo: "https://pimcore.france-media.net/var/assets/images/aa_photo.png",address: "71, AV de Breteuil", city: "Paris", description: "Les auxiliaires des aveugles est une association qui met en lien des personnes aveugles ou malvoyantes avec des bénévoles pour les aider dans leur quotidien.", tag: ["Soin", "Maladie", "Mobilité"]},
    {name: "Le silence des justes", photo: "https://lesilencedesjustes.fr/wp-content/uploads/2019/05/La-Boutique-des-justes-2.jpg",address: "18, Rue Goubet", city: "Paris", description: "Le silence des justes accompagne les jeunes avec autisme et trouble apparentés, ainsi que leurs familles, depuis la prise en charge précoce jusqu’à leur devenir.", tag: ["Soin", "Maladie", "Lien social"]},
    {name: "AFEH", photo: "https://www.afeh.net/images/LOGO/Logo_AFEH_Bloc.png",address: "8, Rue Brillat Savarin", city: "Paris" ,description:"L’AFEH est l’association des familles d’enfants handicapés de La Poste et Orange. Créée en 1969, elle informe, conseille, soutient et accompagne les familles adhérentes tout au long du parcours de vie de leur enfant, quels que soient son âge et le type de handicap.",tag: ["Aide à domicile", "Soin", "Mobilité"]},
    
]

associations.each do |asso|
    set_asso(asso[:name], asso[:photo], asso[:address], asso[:city], asso[:description], asso[:tag])
end

Asso.find_by(name: "ADMR").update(address: "184 A, rue du Faubourg Saint-Denis", phone_number: "01 44 65 55 55", email: "info@admr.org", website: "https://www.admr.org/")

Asso.find_by(name: "Je t'aide").update(address: "54, rue Molière", email: " contact@associationjetaide.org", website: "https://associationjetaide.org/")

Asso.find_by(name: "Emmaüs").update(address: "47, avenue de la Résistance", email: "relation.donateurs@emmaus-france.org", website: "https://emmaus-france.org/")













