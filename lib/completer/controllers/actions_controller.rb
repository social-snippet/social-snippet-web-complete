::Completer::Application.controller :actions do

  require "json"
  require "rack/parser"
  require "social_snippet"

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  post :install, :provides => :json do
    params[:repos].each do |repo_name|
      social_snippet.api.install_repository_by_name repo_name, nil
    end
    {
      :status => "OK",
    }.to_json
  end

  post :insert, :provides => :json do
    res = social_snippet.api.insert_snippet(params[:text])
    {
      :status => "OK",
      :text => res,
    }
  end

end
