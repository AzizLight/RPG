# This array contains all the algorithms that need to get required.
algorithms = %w[marvin]

module RubyPasswordGenerator

  # This is the ultimate password generator.
  # It generates all kinds of passwords using
  # other password generators.
  # It's the password generator master class!
  class PasswordGenerator

    # Seperated for the looks
    attr_reader :name, :description, :version
    attr_reader :created_at, :updated_at, :author, :license

    def initialize
    end

    def generate
    end

    def identity
      @name        = "RPG"
      @description = "A ruby password generator"
      @version     = RubyPasswordGenerator::VERSION
      @created_at  = "2011-03-10"
      @updated_at  = "2011-03-10"
      @author      = "Aziz Light"
      @license     = "MIT License"

      @identity  = "Name:          #{@name}\n"
      @identity << "Description:   #{@description}\n"
      @identity << "Author:        #{@author}\n"
      @identity << "Created on:    #{@created_at}\n"
      @identity << "Last modified: #{@updated_at}\n" if @created_at != @updated_at
      @identity << "License:       #{@license}\n"
      @identity << "Version:       #{@version}\n"
      @identity
    end

    def self.register(classname, filepath)
      raise NameError     unless classname.is_a?(Class)
      raise ArgumentError unless File.exists?(filepath)

      raise unless classname.public_method_defined?(:generate) || classname.public_method_defined?(:identity)
    end

    def self.list
    end

    def self.load
    end

  end
end

# Require all the algorithms.
algorithms.each do |algorithm|
  require_relative "algo/#{algorithm}.rb"
end
