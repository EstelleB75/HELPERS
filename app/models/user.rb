class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favs, dependent: :destroy
  has_one_attached :photo

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def favorites?(asso)
    self.favs.map(&:asso_id).include?(asso.id)
  end

  def get_fav(asso)
    self.favs.find_by(asso_id: asso.id)
  end
end
