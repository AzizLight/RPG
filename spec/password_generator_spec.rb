require_relative "spec_helper"

describe "Password Generator" do

  # it should have the following methods
  [:generate, :identity].each do |method|
    it "should have a #{method} method" do
      RubyPasswordGenerator::PasswordGenerator.public_method_defined?(method).must_be :==, true
    end
  end

  # it should have the following class methods
  [:list, :register, :load].each do |method|
    it "should have a #{method} method" do
      RubyPasswordGenerator::PasswordGenerator.must_respond_to method
    end
  end

  describe "register" do
    it "should require two arguments" do
      pg = RubyPasswordGenerator::PasswordGenerator

      lambda do
        pg.register
      end.must_raise ArgumentError
    end

    # TODO: Fill that string.
    it "should require TWO arguments" do
      pg = RubyPasswordGenerator::PasswordGenerator

      lambda do
        pg.register("FooBarQuuxBazYay!")
      end.must_raise ArgumentError
    end

    it "should have the name of the algorithm class as the first argument" do
      pg = RubyPasswordGenerator::PasswordGenerator

      algo = :MyClass
      unless algo.is_a?(Class)
        lambda do
          pg.register(algo, "FooBarQuuxBazYay")
        end.must_raise NameError, "The algorithm class #{algo} is not valid or could not be found!"
      end
    end

    it "should have the path to the class file as the second argument" do
      pg = RubyPasswordGenerator::PasswordGenerator

      algo = "/not/a/valid/path/"
      unless File.exists?(algo)
        lambda do
          pg.register(Object, algo)
        end.must_raise ArgumentError, "The class file #{algo} doesn't exists!"
      end
    end

  end

end
