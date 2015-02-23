require "spec_helper"

describe ::Completer::Application do

  def app
    ::Completer::Application.new
  end

  context "GET /" do
    before { get "/" }
    subject { last_response }
    it { should be_ok }
    context "parse json" do
      subject { ::JSON.parse last_response.body }
      it { should have_key "status" }
      it { expect(subject["status"]).to eq "OK" }
    end
  end

  describe "actions" do

    context "POST /repos" do
      let(:params) do
        {
          :repos => ["example-repo"],
        }
      end
      let(:headers) do
        {
          "Content-Type" => "application/json",
        }
      end
      before { post "/actions/install", params, headers }
      subject { last_response }
      it { should be_ok }
    end

  end # actions

end # ::Completer::Application

