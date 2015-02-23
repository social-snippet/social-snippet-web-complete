require_relative "helpers/rack_test_helper"
require_relative "helpers/database_cleaner_helper"
require_relative "helpers/factory_girl_helper"

RACK_ENV = "test" unless defined?(RACK_ENV)
require_relative "../config/boot"

