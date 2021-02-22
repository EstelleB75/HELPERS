class Association < ApplicationRecord
  has_many :tags, through: :association_tags
  has_many :favs, dependent: :destroy
end
