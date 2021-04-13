class Cosme < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  belongs_to :personalcolor

  with_options presence: true do
    validates :title
    validates :text
    validates :image
    validates :personalcolor_id, numericality: { other_than: 1 } 
  end

  def self.search(search)
    if search != ''
      Cosme.where(['text LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Cosme.all
    end
  end
end
