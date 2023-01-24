# Ruby DRb Logger

Remote logger with minimal effort using Distributed Ruby (DRb).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dlogger', git: 'https://github.com/Staraway225/dlogger'
```

And then execute:

    $ bundle install

## Usage

1. Create and start a server which will receive and display the messages:

   ```ruby
   require "dlogger"

   server = DLogger::Host.new
   server.start
   ```

2. Create and start a client that will be sending the messages to the server:

   ```ruby
   require "dlogger"

   client = DLogger::Client.new
   client.start
   ```

3. Send messages using `DLogger::Client#logger`:
   ```ruby
   client.logger("TestProgname") { "Hello" }
   ```

`DLogger::Client#logger` represents a default Ruby `Logger`.

It is advised to use this gem only inside of a Local Area Network, by exposing DRb interface to the world you're taking the responsibility for potential security breaches since there's no protection supplied.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Staraway225/dlogger.
