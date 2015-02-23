require "json"
require "rack/parser"
require "social_snippet"

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

