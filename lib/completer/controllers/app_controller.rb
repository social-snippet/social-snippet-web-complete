::Completer::Application.controller do

  # It works
  get :index, :provides => :json do
    {
      :status => "OK",
    }.to_json
  end

  configure :development do

    get :secret do
      render :secret_view
    end

  end

end
