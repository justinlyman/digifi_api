# DigifiApi

Ruby wrapper for the DigiFi API V2.

API Docs: <https://docs.digifi.io/v2/reference#introduction>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'digifi_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install digifi_api

## Setup in Rails

1. Add configuration for each environment in config/secrets.yml or whatever your strategy is for storing sensitive variables.

	```yaml
	development:
	  digifi_api:
	    client_id: 'yourclientidhere'
	    client_public_key: 'yourclientpublickeyhere'
	    secret: 'yoursecrethere'
	    base_uri: 'https://cloud.digifi.io/api/v2'
	test:
	  digifi_api:
	    client_id: 'yourclientidhere'
	    client_public_key: 'yourclientpublickeyhere'
	    secret: 'yoursecrethere'
	    base_uri: 'https://cloud.digifi.io/api/v2'
	production:
	  digifi_api:
	    client_id: 'yourclientidhere'
	    client_public_key: 'yourclientpublickeyhere'
	    secret: 'yoursecrethere'
	    base_uri: 'https://cloud.digifi.io/api/v2'
	```

2. Create an initializer: /config/initializers/digifi_api.rb

3. Add the configure block to your initializer

	```ruby
	DigifiApi.configure do |config|
	  config.client_id = Rails.application.secrets.digifi_api.client_id
	  config.client_public_key = Rails.application.secrets.digifi_api.client_public_key
	  config.secret = Rails.application.secrets.digifi_api.secret
	end
	```

## Usage

### ML Models

#### Submit Method:
```ruby
DigifiApi::MLModel.submit('model_name', inputs_hash, options_hash)
```

#### Options:
- client\_transaction\_id :string

### ML Rules Engine

#### Submit Method:
```ruby
DigifiApi::MLRulesEngine.submit('strategy_name', 'strategy_status', variables_hash, options_hash)
```
### Options:
- return\_input\_variables:bool
- return\_processing\_detail:bool
- return\_data\_sources:bool

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/justinlyman/digifi_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DigifiApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/justinlyman/digifi_api/blob/master/CODE_OF_CONDUCT.md).
