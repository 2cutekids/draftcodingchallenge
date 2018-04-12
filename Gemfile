source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'

gem 'mysql2', "0.5.1"
gem "interactor", "~> 3.0"    # alow creation and use of interactors
gem 'rest-client'   #allow for the cbs api calls
gem "active_model_serializers"
group :development, :test do
  gem 'rspec-rails'
end
group :test do
  gem 'factory_girl_rails'
  gem 'faker'
end
#gem 'jsonapi-resources', :git => 'https://github.com/cerebris/jsonapi-resources.git', branch: 'master'
    group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end


# Use Puma as the app server

gem 'puma', '~> 3.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
