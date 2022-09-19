class Article < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
end
