# frozen_string_literal: true

# Public: Create a new Rails application with defaults
#
# Examples
#
#   rails new sample \
#     --skip-bundle \
#     --skip-bootsnap \
#     --skip-test \
#     -m https://raw.githubusercontent.com/dvinciguerra/rails-generators/master/generators/rspec.rb

# development tools
gem_group :development do
  gem 'foreman', require: false
  gem 'solargraph-rails', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

# adding rspec
gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

generate 'rspec:install'

# creating procfile
create_file 'Procfile', <<~EOF
  web: bin/rails server -p 3000 -b 0.0.0.0
EOF
