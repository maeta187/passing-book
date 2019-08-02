class Url < ApplicationRecord
  # belongs_to :user
  belongs_to :bookmark ,optional: true
end
