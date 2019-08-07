class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
  # パスワードの文字数を8~32文字のみ可能にしてください
  validates :password,
            length: { minimum: 8, maximum: 32 }
  # アルファベットだけ、数字だけのパスワードは不可とします。
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i }

  # 最低限「~ @ ~ . ~」の形を許可するようにしてください。
  validates :email,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # 15文字まで許可するようにバリデーションを設定してください。
  validates :name,
            length: { maximum: 15 }

  has_many :bookmarks
  has_many :urls
  accepts_nested_attributes_for :urls, allow_destroy: true
end