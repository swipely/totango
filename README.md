# Totango

[![Gem Version](https://badge.fury.io/rb/totango.png)](http://badge.fury.io/rb/totango)
[![Build Status](https://travis-ci.org/swipely/totango.png?branch=master)](https://travis-ci.org/swipely/totango)

Send events from your Ruby application to Totango

## Installation

Add this line to your application's Gemfile:

    gem 'totango'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install totango

## Usage

First, configure the gem with your service_id.
In a Rails app, you might put this in config/initializers/totango.rb.

```ruby
Totango.configure do |config|
  config.service_id = "SP-NNNN-NN"
end
```

Then, wherever you have an event you'd like to send to Totango, simply:

```ruby
Totango.track({
  :username => email, # Email address of the username performing the action
  :account_id => account_id, # Unique ID of the end-user’s account on your application
  :account_name => account_name, # A human readable name for the account (will be used on Totango’s UI and reports)
  :activity => activity, # Name of the activity the user performed
  :module => module, # Name of the module the user is using within the application
})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
