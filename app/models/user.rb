class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,
    presence: true

  validates :email,
    presence: true,
    uniqueness: true

  validates :password,
    presence: true,
    length: { minimum: 6 },
    confirmation: true,
    format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/ }

  validates :birthday,
      presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
     validates :first_name
     validates :family_name
  end

  with_options presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ } do
     validates :first_name_kana
     validates :family_name_kana
  end

end
