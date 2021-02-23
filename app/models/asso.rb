class Asso < ApplicationRecord
  has_many :tags, through: :association_tags
  has_many :favs, dependent: :destroy

  validates :name, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :email, presence: true
end
