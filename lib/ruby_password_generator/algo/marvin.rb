require_relative "korben"

module RPG

  class Marvin < Korben

    def initialize
    end

    def generate
      length = 42
      password = ""

      # Get the list of characters
      chars = get_chars

      (0...length).each do |i|
        char = chars.shuffle.sample.to_s
        redo if i > 0 && (password.include?(char) || password[-1].downcase == char.downcase)
        password << char
      end

      password
    end
    
    def self.identity
      @name        = "Marvin"
      @description = "Generates a 42 characters long random password with no character repetition."
      @version     = RPG::VERSION
      @created_at  = "2011-13-10"
      @updated_at  = "2011-14-10"
      @author      = "Aziz Light"
      @license     = "MIT License"

      setup_identity!
    end

    private

    def get_chars
      chars = []
      %w(M_LOWERCAS_LETTERS M_UPPERCASE_LETTERS M_NUMBERS M_SPECCIAL_CHARACTERS).each do |constant|
        chars += RPG::Korben.const_get(constant.to_sym)
      end

      chars
    end

  end
end

