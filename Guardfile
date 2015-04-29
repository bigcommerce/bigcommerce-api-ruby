guard 'rspec', all_on_start: false, cmd: 'bundle exec rspec' do
  # Watch spec directory
  watch(%r{^spec\/.+_spec\.rb})

  # Watch lib/*.rb
  watch(%r{^lib\/(.+)\.rb}) do |m|
    "spec/bigcommerce/#{m[1]}_spec.rb"
  end

  # Watch lib/bigcommerce/*.rb
  watch(%r{^lib/bigcommerce/(.+).rb$}) do |m|
    "spec/bigcommerce/unit/#{m[1]}_spec.rb"
  end

  # Watch lib/bigcommerce/(middleware|resources)/*.rb
  watch(%r{^lib/bigcommerce/(middleware|resources)/(.+).rb$}) do |m|
    "spec/bigcommerce/unit/#{m[1]}/#{m[2]}_spec.rb"
  end

  # Watch spec_helper
  watch('spec/spec_helper.rb') { 'spec' }
end
