::Completer::Application.controller do

  # It works
  get :index, :provides => :json do
    {
      :status => "OK",
    }.to_json
  end

  # Complete snippet path
  post :index, :provides => :json do
    begin
      res = social_snippet.api.complete_snippet_path(params[:q])
      {
        :status => "OK",
        :result => res,
      }.to_json
    rescue => e
      {
        :status => "ERROR",
        :error => e.to_s,
      }.to_json
    end
  end

end
