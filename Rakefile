require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  exec "irb -r ascii_art -I ./lib"
end
