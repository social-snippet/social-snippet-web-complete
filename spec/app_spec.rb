require "spec_helper"

describe ::Completer::Application do

  let(:csrf_token) { "dummy-token" }

  def app
    ::Completer::Application.new
  end

  def rack_session
    {
      :csrf => csrf_token,
    }
  end

  def post_with_token(path, data)
    header "X-CSRF-TOKEN", csrf_token
    post(
      path,
      data.to_json,
      {
        "CONTENT_TYPE" => "application/json",
        "rack.session" => rack_session,
      },
    )
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

    context "POST /actions/install" do

      let(:install_params) do
        {
          :repos => ["example-repo"],
        }
      end

      before { post_with_token "/actions/install", install_params }
      subject { last_response }
      it { should be_ok }

      context "POST /actions/complete" do

        let(:complete_params) do
          {
            :q => "// @snip <ex",
          }
        end

        before { post_with_token "/actions/complete", complete_params }
        subject { last_response }
        it { should be_ok }

        context "parse json" do
          subject { ::JSON.parse last_response.body }
          it { should have_key "result" }
          it { expect(subject["result"]).to include "example-repo" }
        end

      end

    end

  end # actions

end # ::Completer::Application

