# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'interactor', '~> 3.0'
gem 'interactor-rails', '~> 2.0'
gem 'jsonapi-serializer'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rack-attack'
gem 'rails', '~> 7.0.4'

# gem "redis", "~> 4.0"
# gem "kredis"
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# gem "image_processing", "~> 1.2"
gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem "rails_best_practices"
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'database_cleaner-active_record'
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
  gem 'webmock'
end
