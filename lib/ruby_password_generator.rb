# Add the current directory to the
# load path unless it's already in there
# $:.unshift(File.dirname(__FILE__)) unless
#   $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require_relative "ruby_password_generator/ruby_password_generator"
require_relative "ruby_password_generator/password_generator"

# DEBUG
require "pp"

module RPG
  VERSION = "0.0.2"
end

algorithms = {
  Korben: "korben",
  Marvin: "marvin"
}
algorithms.each do |file|
  RPG.register algorithms
end
