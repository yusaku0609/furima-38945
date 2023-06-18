class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/ }
  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+Cz/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
