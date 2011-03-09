require_relative "ruby_password_generator/password_generator"
require_relative "ruby_password_generator/version"

# NOTE: This is just for development, later the algo will be
# required by the register method
require_relative "ruby_password_generator/algo/korben"
require_relative "ruby_password_generator/algo/marvin"

# DEBUG
require "pp"

module RubyPasswordGenerator
  def self.version
    VERSION
  end
end
