source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.2.2"

gem 'rpush'
gem 'rpush-redis'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.4'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'mysql2', '~> 0.3.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rubyzip'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
#use Migration_comments for adding comments to database from migration
gem 'migration_comments', github: "pinnymz/migration_comments"

gem 'whenever', require: false

# Use for Amazon's Simple Email Service's
gem 'aws-ses', '0.6.0',require: 'aws/ses'
gem 'puma_worker_killer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'pry'
  gem 'rails-footnotes', '>= 3.7.5.rc4'
  gem 'rails_best_practices'
  gem 'pry-doc'
  gem 'mailcatcher'
  gem 'better_errors'
  gem 'lol_dba'
  gem 'reek'
  gem 'bullet'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # gem 'annotate', '~> 2.6.6'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'factory_girl_rails'
  gem "faker"
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'httparty', '~> 0.13.5'
gem 'httmultiparty'

gem 'to_words'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
