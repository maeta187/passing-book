class Url < ApplicationRecord
  validates :url, presence: true
  # belongs_to :user
  belongs_to :bookmark
  has_many :bookshelves
end
