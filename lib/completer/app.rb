module Completer

  class Application < ::Padrino::Application

    configure :development do
      register ::Padrino::Rendering
    end

    use ::Rack::Parser, :parsers => {
      "application/json" => proc {|data| ::JSON.parse data }
    }

    def social_snippet
      @social_snippet ||= ::SocialSnippet::Core.new
    end

  end

end

