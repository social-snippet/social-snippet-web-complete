require "bundler/setup"

ENV["RACK_ENV"] = "test"

#
# padrino tasks
#
require "padrino-core/cli/rake"
::PadrinoTasks.init

#
# rspec tasks
#
begin

  require "rspec/core/rake_task"

  ::RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = [
      "--format doc",
      "--color",
    ]
  end

rescue LoadError
  # nothing to do
end

