::Completer::Application.controller do

  # It works
  get :index, :provides => :json do
    {
      :status => "OK",
    }.to_json
  end

  get :token, :provides => :json do
    {
      :token => session["csrf"],
    }.to_json
  end

  get :repos, :provides => :json do
    {
    }.to_json
  end

  configure :development do

    get :secret do
      render :secret_view
    end

  end

end
