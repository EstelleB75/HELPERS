# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.destroy_all
SubCategory.destroy_all
Category.destroy_all


categories = [
    { cat: "Solidarité", sub_cat: %w{Santé Alimentaire ALP Culture&Loisirs} }, 
    { cat: "Assistance", sub_cat: %w{Harcelement Violences Abus} },
    { cat: "Financier", sub_cat: %w{Emploi Logement Transport Formation&Education Juridique} }
]

tags = {
    "Harcelement" => %w{Travail Conjugal Internet Moral Scolaire},
    "Violences" => %w{Psychologie Enfant Sexuel Femme Religion Policière},
    "Abus" => %w{Prejudice Sénior Succession Fraude Vulnérabilité Manipulation},
    "Santé" => %w{Maladie Mutuelle Nutrition Bien-être Decès Complémentaire},
    "ALP" => ["Aide à domicile", "Soin", "Mobilité", "Lien social", "Service", "Personne agée"],
    "Emploi" => %w{Chômage Insertion Offre Allocation Entrepreunariat Travail},
    "Logement" => %w{Travaux Rénovation Annonce Immobilier Individuel Social},
    "Transport" => %w{Déplacement Abonnement Gratuit Voiture Bus Métro},
    "Formation&Education" => %w{Reconversion Spécialisation Financement Entreprise Région AIF},
    "Juridique" => ["Droit", "Litige", "Procédure", "Conseil", "Démarche", "Faire appel"],
    "Culture&Loisirs" => %w{Sport Vacances Musée Activité Réduction Cours},
    "Alimentaire" => ["Bon d'achat", "Paniers", "Dons", "Ticket restaurant", "Entraide"]
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












