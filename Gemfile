source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.3"

gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

### Killing frozen Puma ###
  # lsof -wni tcp:3000
  # kill -9 PID
############

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver', '~> 3.9.0'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'friendly_id', '~>5.1.0'
gem 'jquery-rails'
gem 'devise', '~> 4.3'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'bootstrap-social-rails'
gem 'httparty'
#gem 'kulas_view_tool', git: 'https://github.com/kulas115/kulas_view_tool'
gem 'kulas_view_tool', '~> 0.1.0'
gem 'petergate', '~>1.7'
gem 'font-awesome-rails', '~> 4.7'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.8'
gem 'carrierwave-aws', '~> 1.3'
gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem 'gritter', '~> 1.2'
gem 'twitter', '~> 6.2'
gem 'redis', '3.3.5'
gem 'redcarpet', '~> 3.4'
gem 'coderay', '~> 1.1', '>= 1.1.2'
gem 'omniauth-google-oauth2'
