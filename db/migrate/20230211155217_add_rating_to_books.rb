# frozen_string_literal: true

class AddRatingToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :rating, :integer, null: false, default: 0
  end
end
