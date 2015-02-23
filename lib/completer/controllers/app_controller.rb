::Completer::Application.controller do

  # It works
  get :index, :provides => :json do
    {
      :status => "OK",
    }.to_json
  end

end
