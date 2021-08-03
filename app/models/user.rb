class User < ApplicationRecord
  validates :encrypted_password,     presence: true, length: { minimum: 6 }
  validates :nickname,presence: true
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
  validates :first_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ここがユーザー本名全角の正規表現
  validates :last_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
  validates :first_name_kana, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
  validates :birthday, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       

end
