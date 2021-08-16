class User < ApplicationRecord
  with_options presence: true do

    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do # ここがユーザー本名全角の正規表現
      validates :last_name
      validates :first_name

      with_options format: { with: /\A[ァ-ヶー－]+\z/ } do # ここがユーザー本名全角の正規表現
        validates :last_name_kana
        validates :first_name_kana
      end
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :messages
end

