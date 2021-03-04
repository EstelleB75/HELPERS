class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :tags

  def to_sentence_label
    case name
    when "Santé" then "blablabla"

    else
      "other"
    end
  end
end
