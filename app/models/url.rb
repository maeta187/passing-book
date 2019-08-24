class Url < ApplicationRecord
  # belongs_to :user
  belongs_to :bookmark
  has_many :bookshelves
end
