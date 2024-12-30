FactoryBot.define do
  factory :book do
    # Assuming the Book model has the following attributes:
    # title, author (association), description, and poster

    sequence(:title) { |n| "Book Title #{n}" }
    description { "This is a sample description for the book." }

    # Association with Author
    association :author

    # Handling the 'poster' attribute if it's an Active Storage attachment
    # This assumes you have a sample image file in 'spec/fixtures/files'
    after(:build) do |book|
      if book.poster.attached?
        # If you want to attach a poster by default, uncomment the following lines:
        # book.poster.attach(
        #   io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'poster.jpg')),
        #   filename: 'poster.jpg',
        #   content_type: 'image/jpeg'
        # )
      end
    end
  end
end
