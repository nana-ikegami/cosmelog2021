class Cosme < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Cosme.where(['text LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Cosme.all
    end
  end

end
