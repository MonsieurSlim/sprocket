source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.2'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'less-rails', '~> 2.7.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'less-rails-semantic_ui'
gem 'autoprefixer-rails', '8.6.5'
gem 'therubyracer'
gem 'sprockets-rails'
gem 'jquery-datatables'
gem 'ajax-datatables-rails'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem "responders"
gem 'slim-rails'
gem 'simple_form'
gem 'pg_search'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'pry'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'rspec-activejob'
  gem 'rspec-benchmark'
  gem 'dotenv-rails'
end


group :test do
  gem 'shoulda'
end

group :qa, :staging, :production do
  gem 'rails_12factor'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
