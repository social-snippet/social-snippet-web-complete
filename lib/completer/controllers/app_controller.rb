::Completer::Application.controller do

  require "json"
  require "rack/parser"
  require "social_snippet"

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  get :index, :provides => :json do
    {
      :status => "OK"
    }.to_json
  end

end
