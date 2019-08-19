class Bookshelf < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  has_many :bookmarks
  acts_as_paranoid
  # accepts_nested_attributes_for :urls,  allow_destroy: true

end
