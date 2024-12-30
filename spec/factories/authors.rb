FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "Author Name #{n}" }

    # If Author has other attributes, define them here
    # e.g., biography, birth_date, etc.
    # biography { "A fascinating biography." }
    # birth_date { Date.new(1970, 1, 1) }
  end
end
