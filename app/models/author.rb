# frozen_string_literal: true

class Author < ApplicationRecord
  # relations
  has_many :books
end
