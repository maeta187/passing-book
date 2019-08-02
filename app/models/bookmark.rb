class Bookmark < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  # validates :image, presence: true

  belongs_to :user
  has_many :urls
  accepts_nested_attributes_for :urls
end
