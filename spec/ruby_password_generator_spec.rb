require_relative "spec_helper"

describe "Ruby Password Generator" do
  
  it "should have a version method that returns the version of the Ruby Password Generator" do
    RubyPasswordGenerator.must_respond_to :version
    RubyPasswordGenerator.version.must_equal RubyPasswordGenerator::VERSION
  end
  
end

