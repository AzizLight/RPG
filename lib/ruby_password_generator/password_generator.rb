# This array contains all the algorithms that need to get required.
algorithms = %w[marvin]

module RPG

  # This is the ultimate password generator.
  # It generates all kinds of passwords using
  # other password generators.
  # It's the password generator master class!
  class PasswordGenerator

    class << self
      # Seperated for the looks
      attr_accessor :name, :description, :version
      attr_accessor :created_at, :updated_at, :author, :license
    end

    def initialize(algo = "Marvin")
    end

    def generate
    end

    # FIXME: Cache the identity instance variable
    def self.identity
      @name        = "RPG"
      @description = "A ruby password generator"
      @version     = RPG::VERSION
      @created_at  = "2011-03-10"
      @updated_at  = "2011-13-10"
      @author      = "Aziz Light"
      @license     = "MIT License"

      setup_identity!
    end

    protected

    def self.setup_identity!
      @identity    = "Name:          #{@name}\n"
      @identity   << "Description:   #{@description}\n"
      @identity   << "Author:        #{@author}\n"
      @identity   << "Created on:    #{@created_at}\n"
      @identity   << "Last modified: #{@updated_at}\n" if @created_at != @updated_at
      @identity   << "License:       #{@license}\n"
      @identity   << "Version:       #{@version}\n"
      @identity
    end
  end
end

# Require all the algorithms.
algorithms.each do |algorithm|
  require_relative "algo/#{algorithm}.rb"
end
