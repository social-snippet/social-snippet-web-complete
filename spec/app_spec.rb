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

    context "POST /actions/install" do

      let(:install_params) do
        {
          :repos => ["example-repo"],
        }
      end

      let(:headers) do
        {
          "Content-Type" => "application/json",
        }
      end

      before { post "/actions/install", install_params, headers }
      subject { last_response }
      it { should be_ok }

      context "POST /actions/complete" do

        let(:complete_params) do
          {
            :q => "// @snip <ex",
          }
        end

        before { post "/actions/complete", complete_params, headers }
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

