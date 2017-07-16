# `hello-sense`

## Installation

```shell
gem install hello-sense
```

## Usage

### Authentication

The Sense API relies on an [OAuth 2](https://oauth.net/2/) [access token](https://www.oauth.com/oauth2-servers/access-tokens/).

(Note: the `client_id` and `client_secret` shown here are taken from the official Sense app's source code.)

```ruby
# Create a session using email and password.
client = Sense::Client.new(client_id: '8d3c1664-05ae-47e4-bcdb-477489590aa4',
                           client_secret: '4f771f6f-5c10-4104-bbc6-3333f5b11bf9',
                           username: 'drisha.wabudeya@example.org',
                           password: 'My super secure password!')
```

```ruby
# Create a session using an existing access token.
client = Sense::Client.new(access_token: '2.fded667b9e9143f591de258ac1fee9c2')
```

```ruby
# Get the timeline for the sleep session from the night of 31 December 2016.
client.timeline('2017-01-01')

# Get the current conditions reported by the device's sensors.
client.sensors
```

```ruby
# Invalidate the session's access token.
client.destroy_token
```

```ruby
# Pull in ~38 days of sensor data, sampled at 5 minute intervals.
data = client.sensors_historical(hours: 920)
File.open('sense_sensor_data.json', 'w') { |f| f.write(JSON.dump(data) }
```

## Contributing

To contribute to the `hello-sense` gem, please see [`CONTRIBUTING`](CONTRIBUTING.md).

## References

* http://jeffhuang.com/extracting_my_data_from_the_hello_sense.html
