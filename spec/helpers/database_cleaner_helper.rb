require "database_cleaner"

::RSpec.configure do |conf|
  conf.before(:suite) do
    ::DatabaseCleaner.strategy = :truncation
    ::DatabaseCleaner.clean_with :truncation
  end

  conf.before do
    ::DatabaseCleaner.start
  end

  conf.after do
    ::DatabaseCleaner.clean
  end
end

