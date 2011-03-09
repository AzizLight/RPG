require_relative "../spec_helper"

describe "Marvin" do

  describe "constants" do

    before do
      @constants = %w[M_LOWERCAS_LETTERS M_UPPERCASE_LETTERS M_NUMBERS M_SPECCIAL_CHARACTERS]
    end

    it "should have the character constants defined" do
      @constants.each do |constant|
        RubyPasswordGenrator::Marvin.const_defined?(constant.to_sym).must_be :==, true, "The #{constant} constant should be defined."
      end
    end

    it "should be arrays" do
      @constants.each do |constant|
        RubyPasswordGenrator::Marvin.const_get(constant.to_sym).is_a?(Array).must_be :==, true, "The #{constant} constant should be an array."
      end
    end

  end

  describe "generate method" do

    before do
      @generator = RubyPasswordGenrator::Marvin.new

    end

    it "should have a generate method" do
      RubyPasswordGenrator::Marvin.public_method_defined?(:generate).must_be :==, true, "The generate method should be defined."
    end

    it "should generate a password of length 42 by default" do
      @generator.generate.length.must_be :==, 42, "The generated password should have a length of 42 if no argument was passed to the constructor"
    end

    it "should not generate passwords that are shorter than 3 characters" do
      lambda do
        RubyPasswordGenrator::Marvin.new(2)
      end.must_raise ArgumentError, "The minimum length of a password is 3 characters."
    end

    it "should not generate passwords that are longer than 255 characters" do
      lambda do
        RubyPasswordGenrator::Marvin.new(256)
      end.must_raise ArgumentError, "The maximum length of a password is 255 characters."
    end

    it "should generate a password string" do
      @generator.generate.is_a?(String).must_be :==, true, "The generate method should return a string."
    end

    it "should generate passwords with spaces in them" do
      @generator.generate.count(" ").wont_be :>, 0
    end

    it "should not generate passwords with duplicate characters" do
      valid = true
      password = @generator.generate
      password.split("").each do |char|
        if password.count(char) > 1
          valid = false
          break
        end
      end

      valid.must_be :==, true, "There shouldn't be repeating chars in the generated password"
    end

    it "should not have the same letter repeated twice in a row in different case" do
      valid = true
      for i in 1...42
        password = @generator.generate.split("")
        password.each_with_index do |char, index|
          unless index  == (password.length - 1)
            if password[index].downcase == password[index + 1].downcase
              valid = false
              break
            end
          end
        end

        break unless valid
      end

      valid.must_be :==, true, "The same character can't be repeated twice in a row with a different case"
    end
  end
end

