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

    it "should generate a 42 characters long password" do
      @generator.generate.is_a?(String).must_be :==, true, "The generate method should return a string."
      @generator.generate.length.must_be :==, 42, "The generate method should generate a 42 characters long string."
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
          if password[index].downcase == password[index + 1].downcase
            valid = false
            break
          end
        end

        break unless valid
      end

      valid.must_be :==, true, "The same character can't be repeated twice in a row with a different case"
    end
    

    
  end
end

