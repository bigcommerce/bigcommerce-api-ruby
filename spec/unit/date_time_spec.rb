require 'spec_helper'

describe Bigcommerce::Api do

  let(:api) do
    Bigcommerce::Api.new({
      :store_url => "https://store-12345.mybigcommerce.com",
      :username => "test", :api_key => "12345"
    })
  end

  let(:rfc2822_datetime) { "Tue, 13 Mar 2012 12:45:26 +0000" }
  let(:rfc2822_date)     { "Mon, 12 Mar 2012 00:00:00 +0000" }

  describe "RFC 2822 DateTime format" do

    it "converts raw date times to RFC 2822 format" do
      api.to_rfc2822(DateTime.parse('2012-03-13 12:45:26 +0000')).should eql rfc2822_datetime
    end
    
    it "converts textual date times to RFC 2822 format" do
      api.to_rfc2822(DateTime.parse('12th March 2012')).should eql rfc2822_date
    end

    it "converts ISO 8601 dates to RFC 2822 format" do
      api.to_rfc2822(DateTime.parse('2012-03-12')).should eql rfc2822_date
    end

  end
  
end
