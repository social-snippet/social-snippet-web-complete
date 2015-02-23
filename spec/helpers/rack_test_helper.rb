#
# load rack-test
#
require "rack/test"

::RSpec.configure do |conf|
  conf.include ::Rack::Test::Methods
end

