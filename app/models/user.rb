class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :password, format: { with: }
    validates :nickname, presence: true
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/ }
    validates :last_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥々一]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true
  end
end
