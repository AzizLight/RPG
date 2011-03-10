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

  it "should have the attributes reader methods" do
    pg = RubyPasswordGenerator::PasswordGenerator.new

    [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
      pg.must_respond_to attr, "It should have a #{attr} reader method"
    end
  end

  it "should not have attributes writer methods" do
    pg = RubyPasswordGenerator::PasswordGenerator.new

    [:name=, :description=, :version=, :created_at=, :updated_at=, :author=, :license=].each do |attr|
      pg.wont_respond_to attr, "It should not have a #{attr} writer method"
    end
  end

  describe "identity" do

    it "should set attributes" do
      pg = RubyPasswordGenerator::PasswordGenerator.new

      pg.identity

      [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
        attribute = pg.method(attr)
        attribute.call.nil?.must_be :==, false, "The identity method did not set the #{attr} attribute"
      end
    end

    it "should have date attributes in the right format" do
      pg = RubyPasswordGenerator::PasswordGenerator.new

      pg.identity

      pg.created_at.must_match /\d{4}-\d{2}-\d{2}/
      pg.updated_at.must_match /\d{4}-\d{2}-\d{2}/
    end
  end
  

  describe "register" do
    before do
      @pg = RubyPasswordGenerator::PasswordGenerator
    end

    it "should require two arguments" do

      lambda do
        @pg.register
      end.must_raise ArgumentError
    end

    # TODO: Fill that string.
    it "should require TWO arguments" do
      lambda do
        @pg.register("FooBarQuuxBazYay!")
      end.must_raise ArgumentError
    end

    it "should have the name of the algorithm class as the first argument" do
      algo = :MyClass
      unless algo.is_a?(Class)
        lambda do
          @pg.register(algo, "FooBarQuuxBazYay")
        end.must_raise NameError, "The algorithm class #{algo} is not valid or could not be found!"
      end
    end

    it "should have the path to the class file as the second argument" do
      algo = "/not/a/valid/path/"
      unless File.exists?(algo)
        lambda do
          @pg.register(Object, algo)
        end.must_raise ArgumentError, "The class file #{algo} doesn't exists!"
      end
    end

  end

end

