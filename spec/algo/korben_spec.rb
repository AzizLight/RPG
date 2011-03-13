require_relative "../spec_helper"

describe "Korben" do

  describe "constants" do

    before do
      @constants = %w[M_LOWERCAS_LETTERS M_UPPERCASE_LETTERS M_NUMBERS M_SPECCIAL_CHARACTERS]
    end

    it "should have the character constants defined" do
      @constants.each do |constant|
        RPG::Korben.const_defined?(constant.to_sym).must_be :==, true, "The #{constant} constant should be defined."
      end
    end

    it "should be arrays" do
      @constants.each do |constant|
        RPG::Korben.const_get(constant.to_sym).is_a?(Array).must_be :==, true, "The #{constant} constant should be an array."
      end
    end

  end

  describe "generate method" do

    before do
      @generator = RPG::Korben.new

    end

    it "should have a generate method" do
      RPG::Korben.public_method_defined?(:generate).must_be :==, true, "The generate method should be defined."
    end

    it "should take one Integer as optional argument" do
      lambda do
        RPG::Korben.new("42")
      end.must_raise ArgumentError, "The only argument accepted is the length which is an Integer!"
    end

    it "should generate a password of length 42 by default" do
      @generator.generate.length.must_be :==, 42, "The generated password should have a length of 42 if no argument was passed to the constructor"
    end

    it "should not generate passwords that are shorter than 3 characters" do
      lambda do
        RPG::Korben.new(2)
      end.must_raise ArgumentError, "The minimum length of a password is 3 characters."
    end

    it "should not generate passwords that are longer than 255 characters" do
      lambda do
        RPG::Korben.new(256)
      end.must_raise ArgumentError, "The maximum length of a password is 255 characters."
    end

    it "should generate a password string" do
      @generator.generate.is_a?(String).must_be :==, true, "The generate method should return a string."
    end

    it "should generate a password with the required length" do
      generator = RPG::Korben.new(10)
      generator.generate.length.must_be :==, 10, "The generate method should generate a string of the required length"
    end

    it "should generate passwords with spaces in them" do
      @generator.generate.count(" ").wont_be :>, 0
    end

  end
end

