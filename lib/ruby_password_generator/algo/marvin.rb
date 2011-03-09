require_relative "korben"

module RubyPasswordGenrator

  class Marvin < Korben

    def initialize
      super(42)
    end

    def generate
      password = ""

      # Get the list of characters
      chars = get_chars

      (0...@length).each do |i|
        char = chars.shuffle.sample.to_s
        redo if i > 0 && (password.include?(char) || password[-1].downcase == char.downcase)
        password << char
      end

      password
    end

    private

    def get_chars
      chars = []
      %w(M_LOWERCAS_LETTERS M_UPPERCASE_LETTERS M_NUMBERS M_SPECCIAL_CHARACTERS).each do |constant|
        chars += RubyPasswordGenrator::Korben.const_get(constant.to_sym)
      end

      chars
    end

  end
end

