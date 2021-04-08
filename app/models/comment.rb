class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cosme

  validates :text, presence: true
end
