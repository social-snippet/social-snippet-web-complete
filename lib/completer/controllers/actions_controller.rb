::Completer::Application.controller :actions do

  require "json"
  require "rack/parser"
  require "social_snippet"

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  def social_snippet
    @social_snippet ||= ::SocialSnippet::Core.new
  end

  post :install, :provides => :json do
  end

end
