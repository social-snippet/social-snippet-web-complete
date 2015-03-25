require "vcr"
VCR.configure do |conf|
  conf.cassette_library_dir = "spec/api_fixtures"
  conf.hook_into :webmock
  conf.configure_rspec_metadata!
  conf.preserve_exact_body_bytes { true }
  conf.default_cassette_options = {
    :serialize_with => :psych,
  }
  conf.ignore_hosts "codeclimate.com"
end

