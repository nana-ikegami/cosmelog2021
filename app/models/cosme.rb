class Cosme < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
end
