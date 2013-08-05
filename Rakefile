require 'bundler/gem_tasks'
require 'ci/reporter/rake/rspec'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => ['ci:setup:rspec', :spec]
