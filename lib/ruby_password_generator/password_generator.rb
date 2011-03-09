# This array contains all the algorithms that need to get required.
algorithms = %w[marvin]

module RubyPasswordGenerator

  # This is the ultimate password generator.
  # It generates all kinds of passwords using
  # other password generators.
  # It's the password generator master class!
  class PasswordGenerator
    def initialize
    end

    def generate
    end

    def identity
    end

    def register(classname, filepath)
      raise NameError     unless classname.is_a?(Class)
      raise ArgumentError unless File.exists?(filepath)
    end

    def list
    end

    def load
    end

  end
end

# Require all the algorithms.
algorithms.each do |algorithm|
  require_relative "algo/#{algorithm}.rb"
end
