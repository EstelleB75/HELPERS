class Tag < ApplicationRecord
  belongs_to :sub_category
  has_many :assos, through: :association_tags

  validates :name, presence: true, uniqueness: true

  def to_sentence_tag
    case name
    when "Aide à domicile" then "Je cherche quelqu'un pour m'aider, une aide à domicile"
    when "Soin" then "J'ai besoin de consulter un médecin, de faire des soins médicaux"
    when "Mobilité" then "Je sollicite une aide mobilité, j'ai besoin de me déplacer"
    when "Lien social" then "Je recherche un organisme social, un entourage de proximité"
    when "Service" then "J'ai besoin d'un service spécifique à un problème domestique"
    else
    "Je consulte les prises en charge dédiées aux handicaps"
    end
  end
end
