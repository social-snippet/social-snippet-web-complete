require "json"
require "rack/parser"
require "social_snippet"
require "social_snippet/supports/github"

SocialSnippet::Repository::DriverFactory.reset_drivers
SocialSnippet::Repository::DriverFactory.add_driver SocialSnippet::Repository::Drivers::GitHubDriver

module Completer

  class Application < ::Padrino::Application

    use ::Rack::Parser, :parsers => {
      "application/json" => proc {|data| ::JSON.parse data }
    }

    def social_snippet
      @social_snippet ||= ::SocialSnippet::Core.new
    end

  end

end

