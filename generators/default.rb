# frozen_string_literal: true

# Public: Create a new Rails application with defaults
#
# Examples
#
#   rails new sample \
#     --skip-bundle \
#     --skip-bootsnap \
#     --skip-test \
#     --javascript=esbuild \
#     -m https://raw.githubusercontent.com/dvinciguerra/rails-generators/master/default.rb

# javascript
gem 'jsbundling-rails'
rake 'javascript:install:esbuild'
rake 'stimulus:install'

# css
gem 'cssbundling-rails'
rake 'css:install:bootstrap'

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
