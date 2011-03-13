require_relative "spec_helper"

describe "Password Generator" do

  before do
    @pg = RPG::PasswordGenerator.new
  end

  it "should have a generate method" do
    RPG::PasswordGenerator.public_method_defined?(:generate).must_equal true
  end

  it "should have a identity class method" do
    RPG::PasswordGenerator.must_respond_to :identity
  end
  

  it "should have one optional argument which is the algorithm to use" do
    pg = RPG::PasswordGenerator.new(:Korben)
  end
  

  it "should have the attributes reader methods" do
    [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
      RPG::PasswordGenerator.must_respond_to attr, "It should have a #{attr} reader method"
    end
  end

  it "should not have attributes writer methods" do
    [:name=, :description=, :version=, :created_at=, :updated_at=, :author=, :license=].each do |attr|
      @pg.wont_respond_to attr, "It should not have a #{attr} writer method"
    end
  end

  describe "identity" do

    before do
      @pg = RPG::PasswordGenerator
    end

    it "should set attributes" do
      @pg.identity

      [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
        RPG::PasswordGenerator.respond_to?(attr).must_equal true, "The identity method did not set the #{attr} attribute"
      end
    end

    it "should have date attributes in the right format" do
      @pg.identity

      @pg.created_at.must_match /\d{4}-\d{2}-\d{2}/
      @pg.updated_at.must_match /\d{4}-\d{2}-\d{2}/
    end

    it "should return a string" do
      @pg.identity.is_a?(String).must_equal true
    end

  end

end


