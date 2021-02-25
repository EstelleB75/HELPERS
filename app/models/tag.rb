class Tag < ApplicationRecord
  belongs_to :sub_category
  has_many :assos, through: :association_tags

  # validates :name, presence: true, uniqueness: true
end
