module Totango

  class Event

    # http://help.totango.com/installing-totango/quick-start-http-api-server-side-integration/
    #
    # Sending an event to Totango
    #
    # The HTTP API can be used to track user-activity from anywhere in your web-app.
    # Simply send the following parametrized HTTP request every time a user performs an important user-action.

    USER_PARAM_SUFFIX = 'u'.freeze
    ACCOUNT_PARAM_SUFFIX = 'o'.freeze

    attr_accessor(
      :service_id,
      :username,
      :account_id,
      :account_name,
      :activity,
      :module,
      :user_attributes,
      :account_attributes
    )

    def initialize(options)
      options.each do |option_name, option_value|
        self.send("#{option_name}=", option_value)
      end
    end

    def query_options
      {
        :sdr_s => service_id, # API identifier of your account on Totango
        :sdr_u => username, # Email address of the username performing the action
        :sdr_o => account_id, # Unique ID of the end-user’s account on your application
        :sdr_odn => account_name, # A human readable name for the account (will be used on Totango’s UI and reports)
        :sdr_a => activity, # Name of the activity the user performed
        :sdr_m => self.module, # Name of the module the user is using within the application
      }.merge!(
        object_attributes(user_attributes, USER_PARAM_SUFFIX).merge!(
          object_attributes(account_attributes, ACCOUNT_PARAM_SUFFIX)
        )
      )
    end

    def object_attributes(attributes, suffix)
      attributes.each_with_object({}) { |i, h| h.merge!({ "sdr_#{suffix}.#{i[0].to_s}".to_sym => i[1] }) }
    end

    def to_url
      URI::HTTP.build({
        :host => 'sdr.totango.com',
        :path => '/pixel.gif/',
        :query => URI.encode_www_form(query_options)
      }).to_s
    end

  end

end
