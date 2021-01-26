class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         
         
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
         
  with_options presence: true do
    validates :nickname
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :huri_first_name
    validates :huri_last_name
    end
    validates :birthday, format: {with: /\A\d{4}[-]\d{2}[-]\d{2}\z/}
  end
end
