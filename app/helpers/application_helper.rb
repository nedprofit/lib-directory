# frozen_string_literal: true

module ApplicationHelper
  def star_rating_class(book, index)
    if index < book.rating
      "fill-yellow-400 stroke-yellow-400"
    else
      "fill-transparent stroke-gray-400"
    end
  end
end
