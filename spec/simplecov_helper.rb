# frozen_string_literal: true

require 'simplecov'
require 'fileutils'

if File.directory?('./coverage/')
  coverage_path = File.realpath('./coverage/')
  FileUtils.rm_rf(coverage_path)
end

SimpleCov.command_name 'Unit Tests'
SimpleCov.minimum_coverage 40
SimpleCov.start do
  add_filter '/bin/'
  add_filter '/coverage/'
  add_filter '/spec/'
  add_filter '/vendor/'
end
