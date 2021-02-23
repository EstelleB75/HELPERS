class Tag < ApplicationRecord
  belongs_to :sub_category
  has_many :associations, through: :association_tags

  validates :name, presence: true, uniqueness: true
end
