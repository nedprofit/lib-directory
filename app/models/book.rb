class Book < ApplicationRecord
  MAX_RATING = 5

  has_one_attached :poster
  has_many :comments, dependent: :destroy
  belongs_to :author
  # belongs_to :user

  validates :title, :author_id, presence: true
  validates :rating, numericality: { in: 0..MAX_RATING }

  def author_name
    author.name
  end
end
