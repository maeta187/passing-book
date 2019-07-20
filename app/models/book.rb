class Book < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :title, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :books
end
