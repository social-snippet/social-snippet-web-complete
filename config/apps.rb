::Padrino.configure_apps do
  logger.info "Setup rack-protection"
  disable :sessions
  set :protection, false
  set :protect_from_csrf, false
  use ::Rack::Session::Pool, :key => "s", :path => "/", :expire_after => nil
  use ::Rack::Protection
  use ::Rack::Protection::AuthenticityToken
end

::Padrino.mount("Completer::Application").to("/")
