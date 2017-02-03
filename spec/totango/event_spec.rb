require 'spec_helper'

describe Totango::Event do

  subject {
    described_class.new({
      :service_id => "SP-xxxxyy",
      :account_id => "u12214",
      :account_name => "Barksdale+Industries",
      :username => "avon@barksdale.com",
      :activity => "Login",
      :module => "Application",
      :user_attributes => {
        :name => "John Doe"
      },
      :account_attributes => {
        :account_type => 'Demo'
      }
    })
  }

  describe "#query_options" do
    it "builds a query hash for a Totango pixel URL" do
      expect( subject.query_options ).to eq({
        :sdr_s => "SP-xxxxyy",
        :sdr_o => "u12214",
        :sdr_odn => "Barksdale+Industries",
        :sdr_u => "avon@barksdale.com",
        :sdr_a => "Login",
        :sdr_m => "Application",
        :"sdr_u.name" => "John Doe",
        :"sdr_o.account_type" => "Demo"
      })
    end
  end

  describe "#to_url" do
    it "builds a Totango pixel URL" do
      url = URI.parse( subject.to_url )

      expect( url.host ).to eq( 'sdr.totango.com' )
      expect( url.path ).to eq( "/pixel.gif/" )

      query_options = Hash[URI.decode_www_form(url.query)]
      expect( query_options ).to eq({
        "sdr_s" => "SP-xxxxyy",
        "sdr_o" => "u12214",
        "sdr_odn" => "Barksdale+Industries",
        "sdr_u" => "avon@barksdale.com",
        "sdr_a" => "Login",
        "sdr_m" => "Application",
        "sdr_u.name" => "John Doe",
        "sdr_o.account_type" => "Demo"
      })
    end
  end

end

