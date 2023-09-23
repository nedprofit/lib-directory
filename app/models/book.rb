class Book < ApplicationRecord
  MAX_RATING = 5

  has_one_attached :poster
  has_many :comments
  has_one :author

  belongs_to :user

  validates :rating, numericality: { in: 0..MAX_RATING }

  def author(author_id)
    Author.find(author_id).name
  end
end
