module RubyPasswordGenrator

  class Marvin

    M_LOWERCAS_LETTERS    = ("a".."z").to_a
    M_UPPERCASE_LETTERS   = ("A".."Z").to_a
    M_NUMBERS             = (0..9).to_a
    M_SPECCIAL_CHARACTERS = "!@#()_-+=[]{} ".split("")

    def initialize
    end

    def generate
      password = (M_LOWERCAS_LETTERS + M_UPPERCASE_LETTERS).shuffle.join[0...42]
      password
    end

  end
end

