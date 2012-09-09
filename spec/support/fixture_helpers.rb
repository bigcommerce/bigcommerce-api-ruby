module FixtureHelpers
  def load_json_fixture(name)
    File.read(File.expand_path("../fixtures/#{name}.json", File.dirname(__FILE__)))
  end
end

RSpec.configure do |c|
  c.include FixtureHelpers
end
