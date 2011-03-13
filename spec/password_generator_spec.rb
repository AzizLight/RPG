require_relative "spec_helper"

describe "Password Generator" do

  before do
    @pg = RPG::PasswordGenerator
  end

  it "should have a generate method" do
    @pg.public_method_defined?(:generate).must_equal true
  end

  it "should have a identity class method" do
    @pg.must_respond_to :identity
  end

  it "should have the attributes reader methods" do
    [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
      @pg.must_respond_to attr, "It should have a #{attr} reader method"
    end
  end

  it "should not have attributes writer methods" do
    [:name=, :description=, :version=, :created_at=, :updated_at=, :author=, :license=].each do |attr|
      @pg.new.wont_respond_to attr, "It should not have a #{attr} writer method"
    end
  end

  describe "initialize" do
    it "should have one optional argument which is the algorithm to use" do
      pg = @pg.new(:Korben)
    end
    
    describe "first argument" do
      it "should be a symbol" do
        lambda do
          @pg.new("Marvin")
        end.must_raise TypeError, "The first argument of the PasswordGenerator constructor needs to be a symbol!"
      end
      
    end
    

    it "should set the algo instance variable" do
      pg = @pg.new(:Korben)
      pg.instance_variable_defined?(:@algo).must_equal true, "The algo instance variable was not defined by the constructor"
    end
    
    it "should check if the algorithm exists" do
      lambda do
        pg = @pg.new(:ThisAlgorithmDoesNotExists)
      end.must_raise ArgumentError
    end
    
  end

  describe "generate" do
    it "should return a string" do
      @pg.new.generate.is_a?(String).must_equal true
    end
   
  end
  

  describe "identity" do

    it "should set attributes" do
      @pg.identity

      [:name, :description, :version, :created_at, :updated_at, :author, :license].each do |attr|
        @pg.respond_to?(attr).must_equal true, "The identity method did not set the #{attr} attribute"
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


