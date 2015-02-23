::Completer::Application.controller do

  require "json"
  require "rack/parser"

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  get :index do
    "ok"
  end

end
