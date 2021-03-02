class Asso < ApplicationRecord
  has_many :association_tags
  has_many :tags, through: :association_tags
  has_many :favs, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :city, presence: true
  validates :description, presence: true
  # validates :email, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
