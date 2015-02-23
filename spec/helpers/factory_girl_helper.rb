require "factory_girl"

::RSpec.configure do |conf|
  conf.before do
    ::FactoryGirl.reload
  end
end

