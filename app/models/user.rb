class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validatas :nickname, presence: true
  validatas :first_name, presence: true
  validatas :last_name, presence: true
  validatas :huri_first_name, presence: true
  validatas :huri_last_name, presence: true
  validatas :birthday, presence: true

end
