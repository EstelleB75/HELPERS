class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :tags

  def to_sentence_label
    case name
    when "Santé" then "Je cherche à résoudre un problème de santé"
    when "Dons" then "J'ai un besoin nutritionnel, ma recherche concerne l'alimentation"
    when "Aide à la Personne" then "Je recherche un soutien, une aide à la personne"
    else
      "Je cherche une activité gratuite, de culture ou de loisirs"
    end
  end
end
