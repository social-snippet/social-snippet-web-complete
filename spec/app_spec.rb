require "spec_helper"

describe ::Completer::Application do

  def app
    ::Completer::Application.new
  end

  context "GET /" do
    before { get "/" }
    subject { last_response }
    it { should be_ok }
    it { expect(subject.body).to eq "ok" }
  end

end

