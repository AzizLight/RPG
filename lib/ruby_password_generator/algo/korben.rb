module RubyPasswordGenrator

  class Korben

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

  end
end

