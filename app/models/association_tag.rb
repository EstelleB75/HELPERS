class AssociationTag < ApplicationRecord
  belongs_to :asso
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :asso_id }
end
