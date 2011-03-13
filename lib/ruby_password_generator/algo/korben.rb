module RPG
  class Korben < PasswordGenerator

    M_LOWERCAS_LETTERS    = ("a".."z").to_a
    M_UPPERCASE_LETTERS   = ("A".."Z").to_a
    M_NUMBERS             = (0..9).to_a
    M_SPECCIAL_CHARACTERS = "!@#()_-+=[]{}".split("")

    def initialize(length = 42)
      raise ArgumentError unless length.is_a?(Integer)
      raise ArgumentError unless length >= 3 && length <= 255

      @length = length
    end

    def generate
      password = ""
      (0...@length).each do
        char = (M_LOWERCAS_LETTERS + M_UPPERCASE_LETTERS + M_NUMBERS + M_SPECCIAL_CHARACTERS).shuffle.sample
        password << char
      end

      password
    end

    def self.identity
      @name        = "Korven"
      @description = "Generates a random password of 42 characters or any size between 2 and 255."
      @version     = RPG::VERSION
      @created_at  = "2011-13-10"
      @updated_at  = "2011-13-10"
      @author      = "Aziz Light"
      @license     = "MIT License"

      setup_identity!
    end
  end
end

