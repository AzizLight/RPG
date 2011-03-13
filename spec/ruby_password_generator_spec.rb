require_relative "spec_helper"

describe "Ruby Password Generator" do


  # CHANGED: I removed the :load method and called by register
  # it should have the following class methods
  [:list, :register, :version].each do |method|
    it "should have a #{method} method" do
      RPG.must_respond_to method
    end
  end

  it "should have a version method that returns the version of the Ruby Password Generator" do
    RPG.version.must_equal RPG::VERSION
  end

  describe "register" do
    before do
      @pg = RPG
    end

    it "should require one or two arguments" do

      lambda do
        @pg.register
      end.must_raise ArgumentError

      lambda do
        @pg.register(:myclass, "", 42)
      end.must_raise ArgumentError
    end

    it "should have valid arguments(the argument)" do
      # NOTE: It might be better to break this test into smaller ones

      lambda do
        @pg.register(12)
      end.must_raise TypeError, "The first argument needs to be a hash when passed alone."

      lambda do
        @pg.register("", "")
      end.must_raise TypeError, "The first argument needs to be a symbol when passed with another argument."

      lambda do
        @pg.register(:MyClass, {})
      end.must_raise TypeError, "The second argument needs to be a string."
    end

    it "should add the registed algorithm to the list" do
      @pg.register(:Marvin, "marvin")

      RPG.list.fetch(:Marvin).must_equal "Marvin"
    end

    it "should add the registed algorithms to the list" do
      @pg.register({:Korben => "korben", :Marvin => "marvin"})

      RPG.list.fetch(:Korben).must_equal "Korben"
      RPG.list.fetch(:Marvin).must_equal "Marvin"
    end

  end

end

