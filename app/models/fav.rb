class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :association

  validates :user_id, uniqueness: { scope: :association_id }
end
