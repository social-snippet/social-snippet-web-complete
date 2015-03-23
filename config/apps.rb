::Padrino.configure_apps do
  same_origins = [
    "https://ssedit.herokuapp.com",
  ]
  # if SAME_ORIGIN = A::B then [A, B]
  same_origins.push *ENV["SAME_ORIGIN"].split("::") unless ENV["SAME_ORIGIN"].nil?
  logger.info "same origins = #{same_origins.join $/}"

  logger.info "Setup rack-protection"
  disable :sessions
  set :protection, false
  set :protect_from_csrf, false
  use ::Rack::Session::Pool, {
    :key => "s",
    :domain => nil,
    :path => nil,
    :http_only => false,
    :expire_after => nil,
  }
  use ::Rack::Protection, :except => :http_origin
  use ::Rack::Protection::AuthenticityToken
  use ::Rack::Protection::HttpOrigin, :origin_whitelist => same_origins

  use ::Rack::Cors do
    allow do
      origins *same_origins
      resource "/token", :headers => [], :methods => [:get]
    end

    allow do
      origins *same_origins
      resource "/actions/*", :headers => ["Accept", "X-CSRF-Token", "Content-Type"], :methods => [:get, :post, :options]
    end
  end
end

::Padrino.mount("Completer::Application").to("/")
