module RubyPasswordGenrator

  class Marvin

    M_LOWERCAS_LETTERS    = ("a".."z").to_a
    M_UPPERCASE_LETTERS   = ("A".."Z").to_a
    M_NUMBERS             = (0..9).to_a
    M_SPECCIAL_CHARACTERS = "!@#()_-+=[]{} ".split("")

    def initialize
      
    end

    def generate
      " " * 42
    end

    def identity
      
    end

    private

    def get_random_character
      char = RubyPasswordGenrator::Marvin.const_get(:M_LOWERCAS_ELETTERS)
      char
    end

  end
end

