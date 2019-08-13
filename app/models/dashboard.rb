class Dashboard < ApplicationRecord
  belongs_to :user

  validates :title, length: {minimum: 3, maximum: 15},  allow_blank: false
  validates :body,  length: {minimum: 5, maximum: 200}, allow_blank: false
end
