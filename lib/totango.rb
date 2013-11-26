require "totango/version"
require "totango/configuration"
require "totango/event"
require 'excon'

module Totango

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def track(event_attributes)
      Excon.get(build_event(event_attributes).to_url)
    end

    def build_event(event_attributes)
      event = Event.new(event_attributes)
      event.service_id = configuration.service_id if configuration
      event
    end
  end

end
