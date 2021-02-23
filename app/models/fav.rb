class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :asso

  validates :user_id, uniqueness: { scope: :asso_id }
end
