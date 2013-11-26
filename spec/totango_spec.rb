require 'spec_helper'

describe Totango do

  describe '.configure' do
    let(:service_id) { 'my-service-id' }

    it "sets service_id" do
      expect( described_class.configuration ).to be_nil

      described_class.configure do |config|
        config.service_id = service_id
      end

      expect( described_class.configuration.service_id ).to eq( service_id )
    end
  end

  describe '.track(event_attributes)' do
    let(:event_attributes) { double }
    let(:url) { double }

    let(:event) { double(Totango::Event, to_url: url) }

    before do
      subject.stub(:build_event).with(event_attributes) { event }
    end

    it 'builds and submits an event' do
      Excon.should_receive(:get).with(url)
      subject.track(event_attributes)
    end
  end

end
