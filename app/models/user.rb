class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  with_options presence: true do
  validates :nickname
  validates :birth_day
end
with_options presence: true,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
  validates :famiry_name
  validates :last_name
end
with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'is invalid. Input full-width katakana characters' } do
validates :famiry_name_kana
validates :last_name_kana
end
end
