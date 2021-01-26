class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         
         
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         
  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates :huri_first_name, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :huri_last_name, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, format: {with: /\A\d{4}[-]\d{2}[-]\d{2}\z/}
  end
end
