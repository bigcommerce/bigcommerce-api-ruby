require 'spec_helper'

describe "BigCommerce" do
  describe "require 'big_commerce'" do
    it "should raise exception when required" do
      lambda { (require 'big_commerce').should raise(RuntimeError) }
    end
  end
end
