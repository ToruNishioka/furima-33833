class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, length: { minimum: 6 }, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'には全角カタカナを使用してください' } do
    validates :last_name_k
    validates :first_name_k
  end

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  has_many :items
end
