require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'bigcommerce'

RSpec::Core::RakeTask.new do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = false
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: [:rubocop, :spec]
