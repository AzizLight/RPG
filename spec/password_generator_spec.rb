require_relative "spec_helper"

describe "Password Generator" do

  # it should have the following methods
  [:generate, :identity, :list, :register, :load].each do |method|
    it "should have a #{method} method" do
      RubyPasswordGenerator::PasswordGenerator.public_method_defined?(method).must_be :==, true
    end
  end

  describe "register" do
    it "should require two arguments" do
      pg = RubyPasswordGenerator::PasswordGenerator.new

      lambda do
        pg.register
      end.must_raise ArgumentError
    end

    # TODO: Fill that string.
    it "should require TWO arguments" do
      pg = RubyPasswordGenerator::PasswordGenerator.new

      lambda do
        pg.register("")
      end.must_raise ArgumentError
    end

    # TODO: split that test
    it "should require two valid arguments" do
      pg = RubyPasswordGenerator::PasswordGenerator.new

      lambda do
        pg.register("", "")
      end.must_raise ArgumentError, "The register method requires two valid arguments"
    end

  end

end
