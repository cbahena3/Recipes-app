class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :image, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
end
