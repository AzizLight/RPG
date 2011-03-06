require_relative "spec_helper"

describe "Password Generator" do

  # it should have the following methods
  [:generate, :identity, :list, :register, :load].each do |method|
    
    it "should have a #{method} method" do
      RubyPasswordGenerator::PasswordGenerator.public_method_defined?(method).must_be :==, true
    end
  end

end
