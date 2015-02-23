RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined?(RACK_ENV)
PADRINO_ROOT = ::File.expand_path("../..", __FILE__) unless defined?(PADRINO_ROOT)

require "padrino-core"
require "mongoid"

::Padrino.configure_apps do
end

::Padrino.before_load do
  require "mongoid"
end

::Padrino.after_load do
end

::Padrino.load!

