class AssociationTag < ApplicationRecord
  belongs_to :association
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :association_id }
end
