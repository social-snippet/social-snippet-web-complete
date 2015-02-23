module Completer

  class Application < ::Padrino::Application
    def social_snippet
      @social_snippet ||= ::SocialSnippet::Core.new
    end
  end

end

