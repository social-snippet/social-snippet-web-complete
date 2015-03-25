source "https://rubygems.org"

ruby "2.2.1"

gem "puma"
gem "padrino-core", "~> 0.12"
gem "rack-parser"
gem "rack-cors"
gem "mongoid"

gem "social_snippet"
gem "social_snippet-supports-git", :github => "social-snippet/social-snippet-supports-git", :ref => "empty"
gem "social_snippet-supports-github"
gem "social_snippet-supports-mongoid"

group :development do
  gem "bundler"
  gem "rake"
  gem "slim"
  gem "padrino-helpers", "~> 0.12"
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "database_cleaner"
  gem "factory_girl"
  gem "mongoid-tree"
  gem "vcr"
  gem "webmock"
end

