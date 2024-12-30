source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing"

# Бэкенд
gem "devise" # Flexible authentication solution for Rails with Warden [https://github.com/heartcombo/devise]
gem "rails-i18n" # Поддержка i18n
gem "wicked" # Use wicked to turn your controller into a wizard [https://github.com/zombocom/wicked]

# Фронтенд
gem "simple_form" # Удобный конструктор создания формы
gem "simple_form-tailwind"
gem "vite_rails"

gem "inline_svg" # Embed SVG documents in your Rails views and style them with CSS [https://github.com/jamesmartin/inline_svg]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "view_component" # Build reusable, testable & encapsulable UI components from Ruby classes [https://github.com/viewcomponent/view_component]
gem "turbo-mount"
gem "render_editorjs"

group :development, :test do
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rspec_rails", require: false
  gem "actioncable"
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "listen"
  gem "lookbook"
  gem "bundler-audit"
  gem "brakeman"
  gem "simplecov", require: false
  gem "simplecov-cobertura"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler" # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "ostruct"
  gem "hotwire-livereload"
  gem "prettier_print"
  gem "syntax_tree"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "faker"
  gem "factory_bot_rails"
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
  gem "rspec-rails"
  gem "rspec-collection_matchers"
  gem "webmock"
end
